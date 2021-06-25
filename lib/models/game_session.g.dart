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
    ..currentQuest = json['currentQuest'] as int
    ..started = json['started'] as bool
    ..ended = json['ended'] as bool
    ..players = (json['players'] as List<dynamic>?)
        ?.map((e) => Player.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList()
    ..characters = (json['characters'] as List<dynamic>?)
        ?.map((e) => Character.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList()
    ..quests = (json['quests'] as List<dynamic>?)
        ?.map((e) => Quest.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList()
    ..wonTeam = _$enumDecodeNullable(_$LoyaltyEnumMap, json['wonTeam']);
}

Map<String, dynamic> _$GameSessionToJson(GameSession instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'sessionDbUId': instance.sessionDbUId,
      'numberOfPlayers': instance.numberOfPlayers,
      'numberOfMinions': instance.numberOfMinions,
      'currentQuest': instance.currentQuest,
      'started': instance.started,
      'ended': instance.ended,
      'players': instance.players?.map((e) => e.toJson()).toList(),
      'characters': instance.characters?.map((e) => e.toJson()).toList(),
      'quests': instance.quests?.map((e) => e.toJson()).toList(),
      'wonTeam': _$LoyaltyEnumMap[instance.wonTeam],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$LoyaltyEnumMap = {
  Loyalty.none: 'none',
  Loyalty.arthur: 'arthur',
  Loyalty.mordred: 'mordred',
};
