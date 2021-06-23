import 'package:avalon/services/rt_database.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class QuestTracker extends StatelessWidget {
  QuestTracker({required this.database});
  final RealTimeDataBase database;
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade700,
                            shape: BoxShape.circle),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("${e.questNumber}"),
                        ),
                      ),
                      Text('${e.failsRequired} fails required'),
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
