import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArthursTable extends StatelessWidget {
  final RealTimeDataBase database;
  ArthursTable({required this.database});
  @override
  Widget build(BuildContext context) {
    var circleWidth = MediaQuery.of(context).size.width * 0.98;
    // switch (database.gameSession!.numberOfPlayers) {
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
                //center circle
                Positioned(
                  width: (circleWidth) / 4,
                  top: 5.0,
                  left: circleWidth / 2 - ((circleWidth) / 4) / 2,
                  child: Container(
                    width: (circleWidth) / 4,
                    height: (circleWidth) / 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Percival.png'),
                      ),
                    ),
                  ),
                ),
                //left top circle
                Positioned(
                  width: (circleWidth) / 4,
                  top: (circleWidth) / 5,
                  left: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 4,
                    height: (circleWidth) / 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right tip circle
                Positioned(
                  width: (circleWidth) / 4,
                  top: (circleWidth) / 5,
                  right: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 4,
                    height: (circleWidth) / 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left bottom circle
                Positioned(
                  width: (circleWidth) / 4,
                  top: ((circleWidth) / 5) * 3,
                  left: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 4,
                    height: (circleWidth) / 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right bottom circle
                Positioned(
                  width: (circleWidth) / 4,
                  top: ((circleWidth) / 5) * 3,
                  right: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 4,
                    height: (circleWidth) / 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
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
                Positioned(
                  width: (circleWidth) / 5,
                  top: 5.0,
                  left: circleWidth / 2 - ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: (circleWidth) / 5,
                  left: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right tip circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: (circleWidth) / 5,
                  right: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3,
                  left: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3,
                  right: ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 4 - 5,
                  left: circleWidth / 2 - ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
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
                //center circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: 5.0,
                  left: circleWidth / 2 - ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) / 1.5,
                  left: ((circleWidth) / 5) - ((circleWidth) / 5) / 2.5,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) / 1.5,
                  right: ((circleWidth) / 5) - ((circleWidth) / 5) / 2.5,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2,
                  left: 5.0,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2,
                  right: 5.0,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.5,
                  left: ((circleWidth) / 5),
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.5,
                  right: ((circleWidth) / 5),
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
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
                Positioned(
                  width: (circleWidth) / 5,
                  top: 5.0,
                  left: circleWidth / 2 - ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) / 1.5,
                  left: ((circleWidth) / 5) - ((circleWidth) / 5) / 2.5,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) / 1.5,
                  right: ((circleWidth) / 5) - ((circleWidth) / 5) / 2.5,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2,
                  left: 5.0,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2,
                  right: 5.0,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.35,
                  left: ((circleWidth) / 5) - ((circleWidth) / 5) / 2.5,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.35,
                  right: ((circleWidth) / 5) - ((circleWidth) / 5) / 2.5,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 4 - 5,
                  left: circleWidth / 2 - ((circleWidth) / 5) / 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
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
                Positioned(
                  width: (circleWidth) / 5,
                  top: 5.0,
                  left: ((circleWidth) / 5) * 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 0.5,
                  left: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 0.5,
                  right: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 1.4,
                  left: ((circleWidth) / 5) * 0.15,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 1.4,
                  right: ((circleWidth) / 5) * 0.15,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2.6,
                  left: ((circleWidth) / 5) * 0.15,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2.6,
                  right: ((circleWidth) / 5) * 0.15,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.5,
                  left: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.5,
                  right: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/anonym.png'),
                      ),
                    ),
                  ),
                ),
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
                //center circle
                Positioned(
                  width: (circleWidth) / 5,
                  height: (circleWidth) / 5,
                  top: 5.0,
                  left: ((circleWidth) / 5) * 2,
                  child: Column(
                    children: [
                      Container(
                          width: (circleWidth) / 5,
                          height: (circleWidth) / 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/images/Merlin.png'),
                            ),
                          ),
                          child: Align(
                              child: Text(
                                "${database.player!.name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: FractionalOffset.bottomLeft)),
                    ],
                  ),
                ),
                //left top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 0.5,
                  left: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right top circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 0.5,
                  right: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //left bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 1.4,
                  left: ((circleWidth) / 5) * 0.15,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //right bottom circle
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 1.4,
                  left: ((circleWidth) / 5) * 3.85,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2.6,
                  left: ((circleWidth) / 5) * 0.15,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2.6,
                  left: ((circleWidth) / 5) * 3.85,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.5,
                  left: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 3.5,
                  right: ((circleWidth) / 5) * 0.9,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 4 - 10.0,
                  left: ((circleWidth) / 5) * 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
                //current leader
                Positioned(
                  width: (circleWidth) / 5,
                  top: ((circleWidth) / 5) * 2,
                  left: ((circleWidth) / 5) * 2,
                  child: Container(
                    width: (circleWidth) / 5,
                    height: (circleWidth) / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/Merlin.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
