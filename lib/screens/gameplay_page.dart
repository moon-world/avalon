import 'package:avalon/localization/Localizations.dart';
import 'package:avalon/models/loyalties.dart';
import 'package:avalon/models/player_model.dart';
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
            if (database.gameSession!.ended) {
              if (database.gameSession!.wonTeam == Loyalty.mordred) {
                return Center(
                    child: Column(
                  children: [
                    Text(AvalonLocalizations.of(context).mordredWon,
                        style: TextStyle(
                          fontSize: 30,
                        )),
                    ElevatedButton(
                        onPressed: exitFromGame,
                        child: Text(AvalonLocalizations.of(context).exit)),
                    Row(
                      children: [
                        for (var item in database.gameSession!.players!)
                          Column(children: [
                            Text(item.name),
                            Expanded(
                                child: Align(
                              alignment: Alignment.topCenter,
                              child: Image(
                                image: AssetImage(item.character!.imagePath),
                              ),
                            )),
                          ])
                      ],
                    ),
                  ],
                ));
              } else if (database.gameSession!.wonTeam == Loyalty.arthur) {
                return Center(
                    child: Column(
                  children: [
                    Text(AvalonLocalizations.of(context).arthurWon),
                    ElevatedButton(
                        onPressed: exitFromGame,
                        child: Text(AvalonLocalizations.of(context).exit)),
                    Row(
                      children: [
                        for (var item in database.gameSession!.players!)
                          Column(children: [
                            Text(item.name),
                            Expanded(
                                child: Align(
                              alignment: Alignment.topCenter,
                              child: Image(
                                image: AssetImage(item.character!.imagePath),
                              ),
                            )),
                          ]),
                      ],
                    ),
                  ],
                ));
              }
            }

            if (database.checkIfGameFinished() == Loyalty.mordred) {
              return Center(child: Text('Mordred has won.'));
            } else if (database.checkIfGameFinished() == Loyalty.arthur) {
              return Center(
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(AvalonLocalizations.of(context)
                                .questsSuccess))),
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(AvalonLocalizations.of(context)
                                .assassinCanTry))),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          for (var item in database.gameSession!.players!)
                            Expanded(
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(item.name),
                                    ),
                                    if (database.getPlayer().character!.name ==
                                            'Assassin' &&
                                        item.character!.loyalty ==
                                            Loyalty.mordred)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Expanded(
                                            child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Image(
                                            image: AssetImage(
                                                item.character!.imagePath),
                                          ),
                                        )),
                                      ),
                                    if (database.getPlayer().character!.name !=
                                        'Assassin')
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Expanded(
                                            child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/anonym.png'),
                                          ),
                                        )),
                                      ),
                                  ],
                                ),
                                onTap: database.getPlayer().character!.name ==
                                        'Assassin'
                                    ? () => choosePlayer(database, item)
                                    : null,
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            if (database.isQuestStarted() &&
                database.hasTeamToken() &&
                !database.getPlayer().isMissionVoted)
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

            if (database.isVoteStarted() && !database.getPlayer().isVoted)
              return Center(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onVote(database, true),
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
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onVote(database, false),
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
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      if (database.player!.isLeader)
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: ElevatedButton(
                                onPressed: () => startVoting(database),
                                child: Text(
                                    AvalonLocalizations.of(context).startVote)),
                          ),
                        ),
                      if (database.player!.isLeader)
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: ElevatedButton(
                                onPressed: () => nextQuest(database),
                                child: Text(
                                    AvalonLocalizations.of(context).nextQuest)),
                          ),
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: ElevatedButton(
                              onPressed: () => checkQuest(database, context),
                              child: Text(
                                  AvalonLocalizations.of(context).checkQuest)),
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

  void startVoting(RealTimeDataBase database) {
    database.startVoting();
  }

  void onMissionVote(RealTimeDataBase database, bool vote) {
    database.voteMission(vote);
  }

  void onVote(RealTimeDataBase database, bool vote) {
    database.voteForQuest(vote);
  }

  nextQuest(RealTimeDataBase database) {
    database.nextQuest();
  }

  checkQuest(RealTimeDataBase database, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Vote are:'),
        actions: <Widget>[
          Row(
            children: [
              for (var item in database.getMissionVotes())
                if (item.missionToken)
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/Success_card.png'),
                    ),
                  ))
                else
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/Fail_card.png'),
                    ),
                  ))
            ],
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(AvalonLocalizations.of(context).cancel),
            ), // Need to change this~
          ),
        ],
      ),
    );
  }

  choosePlayer(RealTimeDataBase database, Player item) {
    database.choosePlayer(item);
  }

  void exitFromGame() {}
}
