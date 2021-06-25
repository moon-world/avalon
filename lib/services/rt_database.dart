import 'dart:async';
import 'dart:math';

import 'package:avalon/models/character.dart';
import 'package:avalon/models/game_session.dart';
import 'package:avalon/models/player_model.dart';
import 'package:avalon/models/quest.dart';
import 'package:avalon/models/votes_track.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:convert';

final databaseReference = FirebaseDatabase.instance.reference();
const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
const debugChars =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnoprqrstuvwxyz0123456789';

class RealTimeDataBase extends ChangeNotifier {
  RealTimeDataBase() {
    init();
  }

  Future<void> init() async {
    final response = await rootBundle.loadString('assets/characters.json');
    final data = json.decode(response);
    charactersList = [];
    data['characters'].forEach((value) {
      charactersList.add(Character.fromJson(value));
    });
    questsJson = await rootBundle.loadString('assets/quests.json');
  }

  late String questsJson;
  late List<Character> charactersList;
  GameSession? gameSession;
  Player? player;
  int? needForRejection;
  int? currentLeader;
  late DatabaseReference _gameSessionReference;
  late StreamSubscription<Event> _gameSessionSubscription;
  bool entered = false;

  DatabaseError? _error;

  // ignore: non_constant_identifier_names
  bool createLobby(Player player) {
    _gameSessionReference = databaseReference.child('game_sessions').push();
    gameSession = new GameSession();
    gameSession!.sessionId = createLobbyUID();
    gameSession!.sessionDbUId = _gameSessionReference.key;
    gameSession!.players = [];
    gameSession!.players!.add(player);
    var jsonString = jsonEncode(gameSession);
    Map<String, dynamic> _game = jsonDecode(jsonString);
    _gameSessionReference.set(_game);
    subscribeToGameChanges();
    return true;
  }

  Future<String> enterLobby(String uid, Player player) async {
    var sessions = databaseReference.child('game_sessions');
    try {
      String result = await sessions
          .orderByChild('sessionId')
          .equalTo(uid)
          .once()
          .then((DataSnapshot snapshot) {
        if (snapshot.value == null) {
          return 'There is no such room.';
        }
        var snapshotValue = new Map<String, dynamic>.from(snapshot.value);
        snapshotValue.forEach((key, value) {
          var mappedValue = new Map<String, dynamic>.from(value);
          gameSession = GameSession.fromJson(mappedValue);
          _gameSessionReference =
              sessions.child('${gameSession!.sessionDbUId}');
          subscribeToGameChanges();
        });

        if (gameSession == null) {
          return "Failed enter the lobby.";
        }
        //check if there is space in lobby.
        if (gameSession!.players!.length >= gameSession!.numberOfPlayers) {
          return 'Lobby is full!';
        }
        if (gameSession!.started) {
          return 'Game is Started';
        }
        gameSession!.players!.add(player);
        var jsonString = jsonEncode(gameSession);
        Map<String, dynamic> _game = jsonDecode(jsonString);
        _gameSessionReference.set(_game);
        return 'Entered';
      });

      return result;
    } on Exception catch (e) {
      print(e);
      return 'Exception';
    }
  }

  void exitLobby(Player player) {
    for (var _player in gameSession!.players!) {
      if (_player.mail == player.mail) {
        gameSession!.players!.remove(_player);
        unSubscribeFromGameChanges();
        updateGameSession();
        gameSession = null;
        break;
      }
    }
  }

  void subscribeToGameChanges() {
    _gameSessionSubscription =
        _gameSessionReference.onValue.listen((Event event) {
      _error = null;
      var valueOfSession = new Map<String, dynamic>.from(event.snapshot.value);
      var mappedValue = new Map<String, dynamic>.from(valueOfSession);
      gameSession = GameSession.fromJson(mappedValue);
      notifyListeners();
    }, onError: (Object o) {
      final DatabaseError error = o as DatabaseError;
      _error = error;
    });
  }

  void unSubscribeFromGameChanges() {
    _gameSessionSubscription.cancel();
  }

  String createLobbyUID() {
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  void updateGameSession() {
    var jsonString = jsonEncode(gameSession);
    Map<String, dynamic> _game = jsonDecode(jsonString);
    _gameSessionReference.set(_game);
    notifyListeners();
  }

  void addCharacter(Character character) {
    if (gameSession!.characters == null) {
      gameSession!.characters = [];
    }
    var list = gameSession!.characters!
        .where((c) => character.imagePath == c.imagePath)
        .toList();
    if (list.length == 0) {
      gameSession!.characters!.add(character);
      updateGameSession();
    }
  }

  bool removeCharacter(Character character) {
    if (gameSession!.characters != null) {
      for (var _character in gameSession!.characters!) {
        if (_character.imagePath == character.imagePath) {
          gameSession!.characters!.remove(_character);
          updateGameSession();
          return true;
        }
      }
    }
    return false;
  }

  bool gameIsReady() {
    if (gameSession!.numberOfPlayers == gameSession!.players?.length) {
      if (gameSession!.characters?.length == gameSession!.players?.length) {
        return true;
      }
    }
    return false;
  }

  startGame() {
    //debugCreateGame(); // only for debugging
    gameSession!.characters!.shuffle();
    gameSession!.players!.shuffle();
    for (var i = 0; i < gameSession!.players!.length; i++) {
      gameSession!.players![i].character = gameSession!.characters![i];
      if (player!.name == gameSession!.players![i].name) {
        player!.character = gameSession!.characters![i];
      }
    }
    createQuestTrack();
    if (gameSession!.numberOfPlayers % 2 == 0) {
      needForRejection = gameSession!.numberOfPlayers ~/ 2;
    } else {
      needForRejection = (gameSession!.numberOfPlayers + 1) ~/ 2;
    }
    var rnd = new Random();
    currentLeader = rnd.nextInt(gameSession!.numberOfPlayers - 1);
    gameSession!.players![currentLeader!].isQuestLeader = true;
    gameSession!.started = true;

    updateGameSession();
  }

  createQuestTrack() {
    gameSession!.quests = [];
    switch (gameSession!.numberOfPlayers) {
      case 5:
        var questsData = json.decode(questsJson);
        questsData['five'].forEach((value) {
          gameSession!.quests!.add(createQuest(value));
        });
        break;
      case 6:
        var questsData = json.decode(questsJson);
        questsData['six'].forEach((value) {
          gameSession!.quests!.add(createQuest(value));
        });
        break;
      case 7:
        var questsData = json.decode(questsJson);
        questsData['seven'].forEach((value) {
          gameSession!.quests!.add(createQuest(value));
        });
        break;
      case 8:
        var questsData = json.decode(questsJson);
        questsData['eight'].forEach((value) {
          gameSession!.quests!.add(createQuest(value));
        });
        break;
      case 9:
        var questsData = json.decode(questsJson);
        questsData['nine'].forEach((value) {
          gameSession!.quests!.add(createQuest(value));
        });
        break;
      case 10:
        var questsData = json.decode(questsJson);
        questsData['ten'].forEach((value) {
          gameSession!.quests!.add(createQuest(value));
        });
        break;
      default:
    }
  }

  Quest createQuest(dynamic value) {
    var quest = Quest.fromJson(value);
    quest.votesTracks = [];
    for (var i = 0; i < 5; i++) {
      var votesTrack = new VotesTrack(gameSession!.numberOfPlayers, i + 1);
      for (var _player in gameSession!.players!) {
        votesTrack.votes['${_player.name}'] = false;
      }
      quest.votesTracks!.add(votesTrack);
    }
    return quest;
  }

  debugCreateGame() {
    for (var i = 3; i < gameSession!.numberOfPlayers; i++) {
      gameSession!.players!
          .add(new Player(debugRandom(6), "${debugRandom(4)}@mama.co.il"));
    }
  }

  String debugRandom(int length) {
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => debugChars.codeUnitAt(rnd.nextInt(debugChars.length))));
  }

  void selectPlayer(Player player) {
    for (var _player in gameSession!.players!) {
      if (_player.name == player.name &&
          _player.character!.name == player.character!.name) {
        _player.teamToken = !_player.teamToken;
      }
    }
    updateGameSession();
  }

  startQuest() {
    gameSession!.quests![gameSession!.currentQuest].questStarted = true;
    updateGameSession();
  }

  void voteMission(bool vote) {
    getPlayer().missionToken = vote;
    getPlayer().isMissionVoted = true;
    updateGameSession();
  }

  Player getPlayer() {
    return gameSession!.players!
        .firstWhere((element) => player!.mail == element.mail);
  }

  void startVoting() {
    gameSession!
        .quests![gameSession!.currentQuest]
        .votesTracks![
            gameSession!.quests![gameSession!.currentQuest].currentVote]
        .voteStarted = true;
    updateGameSession();
  }

  bool isQuestStarted() {
    if (gameSession!.quests![gameSession!.currentQuest].questStarted) {
      return true;
    } else {
      return false;
    }
  }

  bool isVoteStarted() {
    if (gameSession!
        .quests![gameSession!.currentQuest]
        .votesTracks![
            gameSession!.quests![gameSession!.currentQuest].currentVote]
        .voteStarted) {
      return true;
    } else {
      return false;
    }
  }

  bool hasTeamToken() {
    if (gameSession!.players!
        .firstWhere((element) => element.mail == player!.mail)
        .teamToken) {
      return true;
    } else {
      return false;
    }
  }

  bool getTeamToken() {
    if (gameSession!.players!
        .firstWhere((element) => element.mail == player!.mail)
        .teamToken) {
      return true;
    } else {
      return false;
    }
  }

  Quest getCurrentQuest() {
    return gameSession!.quests![gameSession!.currentQuest];
  }

  VotesTrack getCurrentVotesTrack() {
    return gameSession!.quests![gameSession!.currentQuest].votesTracks![
        gameSession!.quests![gameSession!.currentQuest].currentVote];
  }

  bool isVoteFinished() {
    if (isVoteStarted()) {
      var count = 0;
      for (var item in gameSession!.players!) {
        if (item.isVoted) {
          count++;
        }
      }
      if (count == gameSession!.players!.length) {
        getCurrentVotesTrack().voteFinished = true;
      }
    }

    if (gameSession!.players!.length % 2 == 0) {}
    if (getCurrentVotesTrack().voteFinished && !entered) {
      getCurrentVotesTrack().checkVotingFailed(needForRejection!);
      entered = true;
      if (!getCurrentVotesTrack().voteFailed) {
        Timer(new Duration(seconds: 5), startQuest);
      } else {
        Timer(new Duration(seconds: 5), resetVoting);
      }

      return true;
    } else {
      return false;
    }
  }

  nextQuest() {
    updateQuest();
    restartPlayersInfo();
    gameSession!.currentQuest++;
    updateGameSession();
  }

  updateQuest() {
    var failedQuests = 0;
    for (var item in getMissionVotes()) {
      if (!item.missionToken) {
        failedQuests++;
      }
    }
    if (failedQuests >= getCurrentQuest().failsRequired) {
      getCurrentQuest().failed = true;
    } else {
      getCurrentQuest().failed = false;
    }
    getCurrentQuest().finished = true;
  }

  restartPlayersInfo() {
    for (var item in gameSession!.players!) {
      item.isVoted = false;
      item.isMissionVoted = false;
      item.missionToken = false;
      item.teamToken = false;
      item.isQuestLeader = false;
    }
    if (currentLeader! >= gameSession!.numberOfPlayers - 1) {
      currentLeader = 0;
    } else {
      currentLeader = currentLeader! + 1;
    }
    gameSession!.players![currentLeader!].isQuestLeader = true;
  }

  List<Player> getMissionVotes() {
    List<Player> votedPlayers = [];
    for (var item in gameSession!.players!) {
      if (item.isMissionVoted) {
        votedPlayers.add(item);
      }
    }
    votedPlayers.shuffle();
    return votedPlayers;
  }

  voteForQuest(bool vote) {
    getCurrentVotesTrack().votes.update(getPlayer().name, (value) => vote);
    getPlayer().isVoted = true;
    getPlayer().voteToken = vote;
    updateGameSession();
  }

  void resetVoting() {
    restartPlayersInfo();
    getCurrentQuest().currentVote++;
    updateGameSession();
  }
}
