import 'package:json_annotation/json_annotation.dart';

part 'votes_track.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class VotesTrack {
  Map<String, bool> votes = <String, bool>{};
  late int numberOfPlayers;
  bool voteFailed = false;
  bool voteFinished = false;
  bool voteStarted = false;
  late int voteNumber;

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

  addVote(String playerName) {
    votes.update(playerName, (value) => false);
  }

  VotesTrack(int numberOfPlayers, int voteNumber) {
    this.numberOfPlayers = numberOfPlayers;
    this.voteNumber = voteNumber;
  }

  factory VotesTrack.fromJson(Map<String, dynamic> json) =>
      _$VotesTrackFromJson(json);

  Map<String, dynamic> toJson() => _$VotesTrackToJson(this);
}
