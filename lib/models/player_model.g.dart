// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map json) {
  return Player(
    json['name'] as String,
  )
    ..character = json['character'] == null
        ? null
        : Character.fromJson(
            Map<String, dynamic>.from(json['character'] as Map))
    ..isLeader = json['isLeader'] as bool
    ..voteToken = json['voteToken'] as bool
    ..teamToken = json['teamToken'] as bool
    ..missionToken = json['missionToken'] as bool;
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'character': instance.character?.toJson(),
      'isLeader': instance.isLeader,
      'voteToken': instance.voteToken,
      'teamToken': instance.teamToken,
      'missionToken': instance.missionToken,
    };
