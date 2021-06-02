import 'dart:async';
import 'dart:math';

import 'package:avalon/models/character.dart';
import 'package:avalon/models/game_session.dart';
import 'package:avalon/models/loyalties.dart';
import 'package:avalon/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
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

  // ignore: non_constant_identifier_names
  CreateLobby(UserModel user) {
    var id = databaseReference.child('game_session').push();

    _gameSession = new GameSession();
    _gameSession?.sessionId = CreateLobbyUID();
    var jsonString = jsonEncode(_gameSession);
    Map<String, dynamic> _game = jsonDecode(jsonString);
    id.set(_game);
  }

  Future<void> EnterLobby(String uid) async {}

  String CreateLobbyUID() {
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}
