class Quest {
  late int questNumber;
  late int failsRequired;
  bool failed = false;
  late List<VotesTrack> votesTracks;
  bool finished = false;
}

class VotesTrack {
  late List<bool> votes;
  late bool voteFailed;

  checkVotingFailed(int numberOfFailsNeeded) {
    int currentVotesFailed = 0;
    for (var vote in votes) {
      if (!vote) currentVotesFailed++;
    }
    if (currentVotesFailed >= numberOfFailsNeeded) {
      voteFailed = true;
    } else {
      voteFailed = false;
    }
  }
}
