import 'package:avalon/models/player_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'votes_track.g.dart';

@JsonSerializable(explicitToJson: true)
class VotesTrack {
  late Map<String, bool> votes;
  late int numberOfPlayers;
  bool voteFailed = false;

  checkVotingFailed(int numberOfFailsNeeded) {
    int currentVotesFailed = 0;
    for (var vote in votes.values) {
      if (!vote) currentVotesFailed++;
    }
    if (currentVotesFailed >= numberOfFailsNeeded) {
      voteFailed = true;
    } else {
      voteFailed = false;
    }
  }

  AddVote(String playerName) {
    votes.update(playerName, (value) => false);
  }

  VotesTrack(int numberOfPlayers) {
    this.numberOfPlayers = numberOfPlayers;
    votes = <String, bool>{};
  }

  factory VotesTrack.fromJson(Map<String, dynamic> json) =>
      _$VotesTrackFromJson(json);

  Map<String, dynamic> toJson() => _$VotesTrackToJson(this);
}
