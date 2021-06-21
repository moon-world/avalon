import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArthursTable extends StatelessWidget {
  final RealTimeDataBase database;
  ArthursTable({required this.database});
  @override
  Widget build(BuildContext context) {
    var circleWidth = MediaQuery.of(context).size.width * 0.98;
    //switch (database.gameSession!.numberOfPlayers) {
    switch (5) {
      case 5:
        return
            //5 players
            Center(
          child: Container(
            width: circleWidth,
            height: circleWidth,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Stack(
              children: <Widget>[
                TopPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0,
                    leftCoordinate: 2),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    leftCoordinate: 0.5),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    leftCoordinate: 3.5),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3,
                    leftCoordinate: 0.5),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3,
                    leftCoordinate: 3.5),
              ],
            ),
          ),
        );
      case 6:
        return
            //6 players
            Center(
          child: Container(
            width: circleWidth,
            height: circleWidth,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Stack(
              children: <Widget>[
                //center circle
                TopPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0,
                    leftCoordinate: 2),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    leftCoordinate: 0.5),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    leftCoordinate: 3.5),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3,
                    leftCoordinate: 0.5),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3,
                    leftCoordinate: 3.5),
                BottomPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 4,
                    leftCoordinate: 2),
              ],
            ),
          ),
        );
      case 7:
        return
            //7 players
            Center(
          child: Container(
            width: circleWidth,
            height: circleWidth,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Stack(
              children: <Widget>[
                TopPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0,
                    leftCoordinate: 2),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    leftCoordinate: 0.6),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    leftCoordinate: 3.4),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 0.1),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 3.9),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 1),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 3),
              ],
            ),
          ),
        );
      case 8:
        return
            //8 players
            Center(
          child: Container(
            width: circleWidth,
            height: circleWidth,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Stack(
              children: <Widget>[
                //center circle
                TopPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    leftCoordinate: 2),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    leftCoordinate: 0.6),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    leftCoordinate: 3.4),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 0.1),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 3.9),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.35,
                    leftCoordinate: 0.6),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.35,
                    leftCoordinate: 3.4),
                BottomPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 4,
                    leftCoordinate: 2),
              ],
            ),
          ),
        );
      case 9:
        return
            //9 players
            Center(
          child: Container(
            width: circleWidth,
            height: circleWidth,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Stack(
              children: <Widget>[
                //center circle
                TopPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0,
                    leftCoordinate: 2),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    leftCoordinate: 0.9),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    leftCoordinate: 3.1),

                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    leftCoordinate: 0.15),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    leftCoordinate: 3.85),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    leftCoordinate: 0.15),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    leftCoordinate: 3.85),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 0.9),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 3.1),
              ],
            ),
          ),
        );
      default:
        return
            //10 players
            Center(
          child: Container(
            width: circleWidth,
            height: circleWidth,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade700, shape: BoxShape.circle),
            child: Stack(
              children: <Widget>[
                TopPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0,
                    leftCoordinate: 2),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    leftCoordinate: 0.9),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    leftCoordinate: 3.1),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    leftCoordinate: 0.15),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    leftCoordinate: 3.85),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    leftCoordinate: 0.15),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    leftCoordinate: 3.85),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 0.9),
                SidePlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 3.1),
                BottomPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 4,
                    leftCoordinate: 2),
                BottomPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 2),
              ],
            ),
          ),
        );
    }
  }
}

class SidePlayer extends StatelessWidget {
  SidePlayer(
      {required this.circleWidth,
      required this.database,
      required this.size,
      required this.topCoordinate,
      required this.leftCoordinate});
  final double circleWidth;
  final RealTimeDataBase database;
  final int size;
  final double topCoordinate;
  final double leftCoordinate;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: (circleWidth) / size,
      top: (circleWidth) / 5 * topCoordinate,
      left: ((circleWidth) / 5) * leftCoordinate,
      child: Container(
        width: (circleWidth) / size,
        height: (circleWidth) / size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/Merlin.png'),
          ),
        ),
      ),
    );
  }
}

class BottomPlayer extends StatelessWidget {
  BottomPlayer(
      {required this.circleWidth,
      required this.database,
      required this.size,
      required this.topCoordinate,
      required this.leftCoordinate});
  final double circleWidth;
  final RealTimeDataBase database;
  final int size;
  final double topCoordinate;
  final double leftCoordinate;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: (circleWidth) / size,
      top: ((circleWidth) / size) * topCoordinate - 10,
      left: ((circleWidth) / 5) * leftCoordinate,
      child: Container(
        width: (circleWidth) / size,
        height: (circleWidth) / size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/Merlin.png'),
          ),
        ),
      ),
    );
  }
}

class TopPlayer extends StatelessWidget {
  TopPlayer(
      {required this.circleWidth,
      required this.database,
      required this.size,
      required this.topCoordinate,
      required this.leftCoordinate});
  final double circleWidth;
  final RealTimeDataBase database;
  final int size;
  final double topCoordinate;
  final double leftCoordinate;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: (circleWidth) / size,
      top: 5.0,
      left: ((circleWidth) / size) * leftCoordinate,
      child: Container(
        width: (circleWidth) / size,
        height: (circleWidth) / size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/Merlin.png'),
          ),
        ),
      ),
    );
  }
}
