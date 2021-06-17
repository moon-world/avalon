// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quest _$QuestFromJson(Map json) {
  return Quest(
    json['questNumber'] as int,
  )
    ..failsRequired = json['failsRequired'] as int
    ..failed = json['failed'] as bool
    ..votesTracks = (json['votesTracks'] as List<dynamic>)
        .map((e) => VotesTrack.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList()
    ..finished = json['finished'] as bool;
}

Map<String, dynamic> _$QuestToJson(Quest instance) => <String, dynamic>{
      'questNumber': instance.questNumber,
      'failsRequired': instance.failsRequired,
      'failed': instance.failed,
      'votesTracks': instance.votesTracks.map((e) => e.toJson()).toList(),
      'finished': instance.finished,
    };
