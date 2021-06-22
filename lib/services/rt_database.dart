import 'dart:async';
import 'dart:math';

import 'package:avalon/models/character.dart';
import 'package:avalon/models/game_session.dart';
import 'package:avalon/models/player_model.dart';
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
  }

  late List<Character> charactersList;
  GameSession? gameSession;
  Player? player;
  late DatabaseReference _gameSessionReference;
  late StreamSubscription<Event> _gameSessionSubscription;

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
    debugCreateGame(); // only for debugging
    gameSession!.characters!.shuffle();
    gameSession!.players!.shuffle();
    for (var i = 0; i < gameSession!.players!.length; i++) {
      gameSession!.players![i].character = gameSession!.characters![i];
    }
    var rnd = new Random();
    gameSession!.players![rnd.nextInt(gameSession!.numberOfPlayers - 1)]
        .isQuestLeader = true;
    gameSession!.started = true;
    updateGameSession();
  }

  debugCreateGame() {
    for (var i = 1; i < gameSession!.numberOfPlayers; i++) {
      gameSession!.players!
          .add(new Player(debugRandom(6), "${debugRandom(4)}@mama.co.il"));
    }
  }

  String debugRandom(int length) {
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => debugChars.codeUnitAt(rnd.nextInt(debugChars.length))));
  }
}
