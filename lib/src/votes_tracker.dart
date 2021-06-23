import 'package:avalon/models/quest.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VotesTracker extends StatelessWidget {
  VotesTracker({required this.quest});
  final Quest quest;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 0.95;
    return Row(
      children: [
        for (var item in quest.votesTracks!)
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth / 5,
              height: screenWidth / 5,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade700, shape: BoxShape.circle),
              child: Align(
                alignment: Alignment.center,
                child: Text("${item.voteFailed}"),
              ),
            ),
          ),
      ],
    );
  }
}
