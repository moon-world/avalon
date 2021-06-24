// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map json) {
  return Player(
    json['name'] as String,
    json['mail'] as String,
  )
    ..character = json['character'] == null
        ? null
        : Character.fromJson(
            Map<String, dynamic>.from(json['character'] as Map))
    ..isLeader = json['isLeader'] as bool
    ..isQuestLeader = json['isQuestLeader'] as bool
    ..voteToken = json['voteToken'] as bool
    ..teamToken = json['teamToken'] as bool
    ..missionToken = json['missionToken'] as bool
    ..isVoted = json['isVoted'] as bool
    ..isMissionVoted = json['isMissionVoted'] as bool;
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'mail': instance.mail,
      'character': instance.character?.toJson(),
      'isLeader': instance.isLeader,
      'isQuestLeader': instance.isQuestLeader,
      'voteToken': instance.voteToken,
      'teamToken': instance.teamToken,
      'missionToken': instance.missionToken,
      'isVoted': instance.isVoted,
      'isMissionVoted': instance.isMissionVoted,
    };
