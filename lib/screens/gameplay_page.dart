import 'package:avalon/models/loyalties.dart';
import 'package:avalon/models/votes_track.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:avalon/src/arthurs_table.dart';
import 'package:avalon/src/quest_tracker.dart';
import 'package:avalon/src/votes_tracker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameplayPage extends StatefulWidget {
  @override
  _GameplayPage createState() => _GameplayPage();
}

class _GameplayPage extends State<GameplayPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 0.95;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Material(
          child:
              Consumer<RealTimeDataBase>(builder: (context, database, child) {
            if (database.isQuestStarted() && database.hasTeamToken())
              return Center(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onMissionVote(database, true),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: screenWidth / 2,
                            child: ClipRRect(
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Success_card.png'),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    if (database.getPlayer().character!.loyalty ==
                        Loyalty.mordred)
                      Expanded(
                        child: GestureDetector(
                          onTap: () => onMissionVote(database, false),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenWidth / 2,
                              child: ClipRRect(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/Fail_card.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );

            if (database.isVoteStarted())
              return Center(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onMissionVote(database, true),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: screenWidth / 2,
                            child: ClipRRect(
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Vote_approve.png'),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    if (database.getPlayer().character!.loyalty ==
                        Loyalty.mordred)
                      Expanded(
                        child: GestureDetector(
                          onTap: () => onMissionVote(database, false),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenWidth / 2,
                              child: ClipRRect(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/vote_reject.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );

            return Column(
              children: [
                Expanded(flex: 5, child: ArthursTable(database: database)),
                if (database.player!.isQuestLeader)
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: ElevatedButton(
                                onPressed: () => startVoting(database),
                                child: Text("Start Voting")),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: ElevatedButton(
                                onPressed: () => startQuest(database),
                                child: Text("Start Quest")),
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                    flex: 2,
                    child: QuestTracker(
                        database: database,
                        quest: database.gameSession!
                            .quests![database.gameSession!.currentQuest])),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: VotesTracker(
                        quest: database.gameSession!
                            .quests![database.gameSession!.currentQuest],
                        database: database),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void startQuest(RealTimeDataBase database) {
    database.startQuest();
  }

  void startVoting(RealTimeDataBase database) {
    database.startVoting();
  }

  void onMissionVote(RealTimeDataBase database, bool vote) {
    database.voteMission(vote);
  }
}
