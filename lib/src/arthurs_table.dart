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
    switch (10) {
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
                    size: 4,
                    topCoordinate: 0,
                    leftCoordinate: 1.5),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 4,
                    topCoordinate: 1,
                    leftCoordinate: 0.5),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 4,
                    topCoordinate: 1,
                    rightCoordinate: 0.5),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 4,
                    topCoordinate: 3,
                    leftCoordinate: 0.5),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 4,
                    topCoordinate: 3,
                    rightCoordinate: 0.5),
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
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    leftCoordinate: 0.5),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1,
                    rightCoordinate: 0.5),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3,
                    leftCoordinate: 0.5),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3,
                    rightCoordinate: 0.5),
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
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    leftCoordinate: 0.6),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    rightCoordinate: 0.6),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 0.1),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    rightCoordinate: 0.1),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 1),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    rightCoordinate: 1),
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
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    leftCoordinate: 0.6),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.66,
                    rightCoordinate: 0.6),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    leftCoordinate: 0.1),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2,
                    rightCoordinate: 0.1),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.35,
                    leftCoordinate: 0.6),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.35,
                    rightCoordinate: 0.6),
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
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    leftCoordinate: 0.9),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    rightCoordinate: 0.9),

                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    leftCoordinate: 0.15),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    rightCoordinate: 0.15),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    leftCoordinate: 0.15),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    rightCoordinate: 0.15),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 0.9),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    rightCoordinate: 0.9),
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
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    leftCoordinate: 0.9),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 0.5,
                    rightCoordinate: 0.9),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    leftCoordinate: 0.15),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 1.4,
                    rightCoordinate: 0.15),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    leftCoordinate: 0.15),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 2.6,
                    rightCoordinate: 0.15),
                LeftPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    leftCoordinate: 0.9),
                RightPlayer(
                    circleWidth: circleWidth,
                    database: database,
                    size: 5,
                    topCoordinate: 3.5,
                    rightCoordinate: 0.9),
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

class LeftPlayer extends StatelessWidget {
  LeftPlayer(
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

class RightPlayer extends StatelessWidget {
  RightPlayer(
      {required this.circleWidth,
      required this.database,
      required this.size,
      required this.topCoordinate,
      required this.rightCoordinate});
  final double circleWidth;
  final RealTimeDataBase database;
  final int size;
  final double topCoordinate;
  final double rightCoordinate;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: (circleWidth) / size,
      top: (circleWidth) / 5 * topCoordinate,
      right: ((circleWidth) / 5) * rightCoordinate,
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
