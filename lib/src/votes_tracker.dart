import 'package:avalon/models/quest.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VotesTracker extends StatelessWidget {
  VotesTracker({required this.quest, required this.database});
  final Quest quest;
  final RealTimeDataBase database;

  @override
  Widget build(BuildContext context) {
    database.isVoteFinished();
    var screenWidth = MediaQuery.of(context).size.width * 0.95;
    List<Widget> list = [];
    for (var item in quest.votesTracks!) {
      if (item.voteFinished && item.voteFailed) {
        list.add(
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth / 5,
              height: screenWidth / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/vote_failed.png'),
                ),
              ),
            ),
          ),
        );
      } else if (item.voteFinished && !item.voteFailed) {
        list.add(
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth / 5,
              height: screenWidth / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/Vote_approve.png'),
                ),
              ),
            ),
          ),
        );
      } else {
        list.add(Expanded(
          flex: 1,
          child: Container(
            width: screenWidth / 5,
            height: screenWidth / 5,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "${item.voteNumber}",
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CinzelDecorative'),
              ),
            ),
          ),
        ));
      }
    }
    return Row(
      children: [
        for (var item in list) item,
      ],
    );
  }
}
