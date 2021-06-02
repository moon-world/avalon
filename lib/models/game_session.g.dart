// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameSession _$GameSessionFromJson(Map<String, dynamic> json) {
  return GameSession()
    ..sessionId = json['sessionId'] as String
    ..numberOfPlayers = json['numberOfPlayers'] as int
    ..numberOfMinions = json['numberOfMinions'] as int
    ..players = (json['players'] as List<dynamic>)
        .map((e) => Player.fromJson(e as Map<String, dynamic>))
        .toList()
    ..playersCharacters =
        (json['playersCharacters'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, Character.fromJson(e as Map<String, dynamic>)),
    )
    ..characters = (json['characters'] as List<dynamic>)
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList()
    ..quests = (json['quests'] as List<dynamic>)
        .map((e) => Quest.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GameSessionToJson(GameSession instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'numberOfPlayers': instance.numberOfPlayers,
      'numberOfMinions': instance.numberOfMinions,
      'players': instance.players?.map((e) => e.toJson()).toList(),
      'playersCharacters':
          instance.playersCharacters?.map((k, e) => MapEntry(k, e.toJson())),
      'characters': instance.characters?.map((e) => e.toJson()).toList(),
      'quests': instance.quests?.map((e) => e.toJson()).toList(),
    };
