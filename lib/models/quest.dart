import 'package:avalon/models/votes_track.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quest.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Quest {
  late int questNumber;
  late int failsRequired;
  bool failed = false;
  late List<VotesTrack> votesTracks;
  bool finished = false;

  Quest(int questNumber) {
    this.questNumber = questNumber;
  }

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestToJson(this);
}
