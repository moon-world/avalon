import 'package:avalon/models/votes_track.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quest.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Quest {
  int questNumber;
  int failsRequired;
  int numberOfPlayers;
  late int currentVote;
  late bool questStarted;
  late bool failed;
  List<VotesTrack>? votesTracks = [];
  late bool finished;

  Quest(this.questNumber, this.failsRequired, this.numberOfPlayers);

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestToJson(this);
}
