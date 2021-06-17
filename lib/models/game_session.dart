import 'package:avalon/models/character.dart';
import 'package:avalon/models/player_model.dart';
import 'package:avalon/models/quest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_session.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true, includeIfNull: true)
class GameSession {
  String? sessionId;
  String? sessionDbUId;
  int numberOfPlayers = 5;
  int numberOfMinions = 2;
  List<Player>? players;
  List<Character>? characters;
  List<Quest>? quests;

  GameSession();

  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);

  Map<String, dynamic> toJson() => _$GameSessionToJson(this);
}
