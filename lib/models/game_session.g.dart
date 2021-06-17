// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameSession _$GameSessionFromJson(Map json) {
  return GameSession()
    ..sessionId = json['sessionId'] as String?
    ..sessionDbUId = json['sessionDbUId'] as String?
    ..numberOfPlayers = json['numberOfPlayers'] as int
    ..numberOfMinions = json['numberOfMinions'] as int
    ..players = (json['players'] as List<dynamic>?)
        ?.map((e) => Player.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList()
    ..characters = (json['characters'] as List<dynamic>?)
        ?.map((e) => Character.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList()
    ..quests = (json['quests'] as List<dynamic>?)
        ?.map((e) => Quest.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
}

Map<String, dynamic> _$GameSessionToJson(GameSession instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'sessionDbUId': instance.sessionDbUId,
      'numberOfPlayers': instance.numberOfPlayers,
      'numberOfMinions': instance.numberOfMinions,
      'players': instance.players?.map((e) => e.toJson()).toList(),
      'characters': instance.characters?.map((e) => e.toJson()).toList(),
      'quests': instance.quests?.map((e) => e.toJson()).toList(),
    };
