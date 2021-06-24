import 'package:avalon/models/quest.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class QuestTracker extends StatelessWidget {
  QuestTracker({required this.database, required this.quest});
  final RealTimeDataBase database;
  final Quest quest;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: CarouselSlider(
            options: CarouselOptions(
                height: 140.0,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: switchQuest),
            items: database.gameSession!.quests!.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      if (!e.finished)
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade700,
                              shape: BoxShape.circle),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${e.questNumber}",
                                style: TextStyle(
                                    fontFamily: 'CinzelDecorative',
                                    fontSize: 40.0)),
                          ),
                        ),
                      if (!e.finished)
                        Text('${e.failsRequired} fails required'),
                      if (e.finished && e.failed)
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image:
                                  AssetImage('assets/images/failed_quest.png'),
                            ),
                          ),
                        ),
                      if (e.finished && !e.failed)
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  'assets/images/quest_successed.png'),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  switchQuest(int index, CarouselPageChangedReason reason) {}
}
