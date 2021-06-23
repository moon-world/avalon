import 'package:avalon/models/votes_track.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quest.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Quest {
  int questNumber;
  int failsRequired;
  int numberOfPlayers;
  bool? failed = false;
  List<VotesTrack>? votesTracks = [];
  bool? finished = false;

  Quest(this.questNumber, this.failsRequired, this.numberOfPlayers) {
    failed = false;
    finished = false;
  }

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestToJson(this);
}
