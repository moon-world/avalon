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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Material(
          child:
              Consumer<RealTimeDataBase>(builder: (context, database, child) {
            return Column(
              children: [
                Expanded(flex: 5, child: ArthursTable(database: database)),
                Expanded(flex: 2, child: QuestTracker(database: database)),
                Expanded(
                    flex: 2,
                    child:
                        VotesTracker(quest: database.gameSession!.quests![0])),
              ],
            );
          }),
        ),
      ),
    );
  }
}
