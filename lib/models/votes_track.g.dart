// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'votes_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VotesTrack _$VotesTrackFromJson(Map json) {
  return VotesTrack(
    json['numberOfPlayers'] as int,
    json['voteNumber'] as int,
  )
    ..votes = Map<String, bool>.from(json['votes'] as Map)
    ..voteFailed = json['voteFailed'] as bool
    ..voteFinished = json['voteFinished'] as bool
    ..voteStarted = json['voteStarted'] as bool;
}

Map<String, dynamic> _$VotesTrackToJson(VotesTrack instance) =>
    <String, dynamic>{
      'votes': instance.votes,
      'numberOfPlayers': instance.numberOfPlayers,
      'voteFailed': instance.voteFailed,
      'voteFinished': instance.voteFinished,
      'voteStarted': instance.voteStarted,
      'voteNumber': instance.voteNumber,
    };
