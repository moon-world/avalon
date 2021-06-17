import 'dart:async';
import 'dart:math';

import 'package:avalon/models/game_session.dart';
import 'package:avalon/models/player_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

final databaseReference = FirebaseDatabase.instance.reference();
const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

class RealTimeDataBase extends ChangeNotifier {
  RealTimeDataBase() {
    init();
  }

  Future<void> init() async {}

  GameSession? _gameSession;
  DatabaseReference? _gameSessionReference;
  late StreamSubscription<Event> _gameSessionSubscription;

  DatabaseError? _error;

  // ignore: non_constant_identifier_names
  bool createLobby(Player player) {
    var id = databaseReference.child('game_sessions').push();

    _gameSession = new GameSession();
    _gameSession!.sessionId = createLobbyUID();
    _gameSession!.sessionDbUId = id.key;
    _gameSession!.players = [];
    _gameSession!.players!.add(player);
    var jsonString = jsonEncode(_gameSession);
    Map<String, dynamic> _game = jsonDecode(jsonString);
    id.set(_game);
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
          _gameSession = GameSession.fromJson(mappedValue);
          _gameSessionReference =
              sessions.child('${_gameSession!.sessionDbUId}');
          subscribeToGameChanges();
        });

        if (_gameSession == null) {
          return "Failed enter the lobby.";
        }
        //check if there is space in lobby.
        if (_gameSession!.players!.length > 9) {
          return 'Lobby is full!';
        }
        _gameSession!.players!.add(player);
        var jsonString = jsonEncode(_gameSession);
        Map<String, dynamic> _game = jsonDecode(jsonString);
        _gameSessionReference!.set(_game);
        return 'Entered';
      });

      return result;
    } on Exception catch (e) {
      print(e);
      return 'Exception';
    }
  }

  void subscribeToGameChanges() {
    _gameSessionSubscription =
        _gameSessionReference!.onValue.listen((Event event) {
      _error = null;
      var valueOfSession = new Map<String, dynamic>.from(event.snapshot.value);
      var mappedValue = new Map<String, dynamic>.from(valueOfSession);
      _gameSession = GameSession.fromJson(mappedValue);
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
}
