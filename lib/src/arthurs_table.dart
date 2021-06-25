import 'package:avalon/models/loyalties.dart';
import 'package:avalon/models/player_model.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<double> TEN_TOP = [0.1, 0.5, 1.4, 2.6, 3.5, 3.9, 3.5, 2.6, 1.4, 0.5];
const List<double> TEN_LEFT = [
  2,
  3.1,
  3.85,
  3.85,
  3.1,
  2,
  0.9,
  0.15,
  0.15,
  0.9
];
const List<double> NINE_TOP = [0.1, 0.5, 1.4, 2.6, 3.5, 3.5, 2.6, 1.4, 0.5];
const List<double> NINE_LEFT = [2, 3.1, 3.85, 3.85, 3.1, 0.9, 0.15, 0.15, 0.9];
const List<double> EIGHT_TOP = [0.1, 0.66, 2, 3.35, 3.9, 3.35, 2, 0.66];
const List<double> EIGHT_LEFT = [2, 3.4, 3.9, 3.4, 2, 0.6, 0.1, 0.6];
const List<double> SEVEN_TOP = [0.1, 0.66, 2, 3.5, 3.5, 2, 0.66];
const List<double> SEVEN_LEFT = [2, 3.4, 3.9, 3, 1, 0.1, 0.6];
const List<double> SIX_TOP = [0.1, 1, 3, 3.9, 3, 1];
const List<double> SIX_LEFT = [2, 3.5, 3.5, 2, 0.5, 0.5];
const List<double> FIVE_TOP = [0.1, 1, 3, 3, 1];
const List<double> FIVE_LEFT = [2, 3.5, 3.5, 0.5, 0.5];

class ArthursTable extends StatelessWidget {
  final RealTimeDataBase database;
  ArthursTable({required this.database});
  @override
  Widget build(BuildContext context) {
    var circleWidth = MediaQuery.of(context).size.width * 0.95;
    switch (database.gameSession!.numberOfPlayers) {
      //switch (6) {
      case 5:
        for (var i = 0; i < database.gameSession!.numberOfPlayers; i++) {
          database.gameSession!.players![i].topCoordinate = FIVE_TOP[i];
          database.gameSession!.players![i].leftCoordinate = FIVE_LEFT[i];
        }
        break;
      case 6:
        for (var i = 0; i < database.gameSession!.numberOfPlayers; i++) {
          database.gameSession!.players![i].topCoordinate = SIX_TOP[i];
          database.gameSession!.players![i].leftCoordinate = SIX_LEFT[i];
        }
        break;
      case 7:
        for (var i = 0; i < database.gameSession!.numberOfPlayers; i++) {
          database.gameSession!.players![i].topCoordinate = SEVEN_TOP[i];
          database.gameSession!.players![i].leftCoordinate = SEVEN_LEFT[i];
        }
        break;
      case 8:
        for (var i = 0; i < database.gameSession!.numberOfPlayers; i++) {
          database.gameSession!.players![i].topCoordinate = EIGHT_TOP[i];
          database.gameSession!.players![i].leftCoordinate = EIGHT_LEFT[i];
        }
        break;
      case 9:
        for (var i = 0; i < database.gameSession!.numberOfPlayers; i++) {
          database.gameSession!.players![i].topCoordinate = NINE_TOP[i];
          database.gameSession!.players![i].leftCoordinate = NINE_LEFT[i];
        }
        break;
      case 10:
        for (var i = 0; i < database.gameSession!.numberOfPlayers; i++) {
          database.gameSession!.players![i].topCoordinate = TEN_TOP[i];
          database.gameSession!.players![i].leftCoordinate = TEN_LEFT[i];
        }
        break;
      default:
    }
    for (var player in database.gameSession!.players!) {
      if (database.getPlayer().character!.loyalty == Loyalty.arthur &&
          (database.getPlayer().character!.name != 'Percival' &&
              database.getPlayer().character!.name != 'Merlin')) {
        if (player.name != database.player!.name) {
          player.character!.showedImagePath = 'assets/images/anonym.png';
        }
      } else if (database.getPlayer().character!.name == 'Merlin') {
        //merlin
        if (player.character!.loyalty == Loyalty.mordred &&
            player.character!.name != 'Mordred') {
          player.character!.showedImagePath = 'assets/images/Evil.png';
        } else {
          player.character!.showedImagePath = 'assets/images/anonym.png';
        }
      } else if (database.getPlayer().character!.name == 'Percival') {
        //percival
        if (player.character!.name == 'Morgana' ||
            player.character!.name == "Merlin") {
          player.character!.showedImagePath = 'assets/images/Merlin.png';
        } else {
          player.character!.showedImagePath = 'assets/images/anonym.png';
        }
      } else if (database.getPlayer().character!.loyalty == Loyalty.mordred) {
        if (player.character!.loyalty == Loyalty.mordred) {
          player.character!.showedImagePath = 'assets/images/Evil.png';
        } else {
          player.character!.showedImagePath = 'assets/images/anonym.png';
        }
      } else {
        player.character!.showedImagePath = 'assets/images/anonym.png';
      }

      if (player.name == database.player!.name) {
        player.character!.showedImagePath = player.character!.imagePath;
      }
    }
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
            for (var player in database.gameSession!.players!)
              SidePlayer(
                  circleWidth: circleWidth,
                  database: database,
                  topCoordinate: player.topCoordinate!,
                  leftCoordinate: player.leftCoordinate!,
                  player: player),
          ],
        ),
      ),
    );
  }
}

class SidePlayer extends StatelessWidget {
  SidePlayer(
      {required this.circleWidth,
      required this.database,
      required this.topCoordinate,
      required this.leftCoordinate,
      required this.player});
  final double circleWidth;
  final RealTimeDataBase database;
  final double topCoordinate;
  final double leftCoordinate;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: (circleWidth) / 5,
      top: (circleWidth) / 5 * topCoordinate,
      left: ((circleWidth) / 5) * leftCoordinate,
      child: GestureDetector(
          child: Container(
            width: (circleWidth) / 5,
            height: (circleWidth) / 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(player.character!.showedImagePath!),
              ),
            ),
            child: Column(
              children: [
                if (player.isQuestLeader)
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/images/current_leader.png'),
                        width: circleWidth / 5 * 0.4,
                      ),
                    ),
                  ),
                if (player.teamToken)
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: AssetImage('assets/images/Team_selector.png'),
                        width: circleWidth / 5 * 0.4,
                      ),
                    ),
                  ),
                if (player.isVoted && !player.voteToken)
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image(
                        image: AssetImage('assets/images/vote_reject.png'),
                        width: circleWidth / 5 * 0.4,
                      ),
                    ),
                  ),
                if (player.isVoted && player.voteToken)
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image(
                        image: AssetImage('assets/images/Vote_approve.png'),
                        width: circleWidth / 5 * 0.4,
                      ),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      player.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => selectPlayer()),
    );
  }

  selectPlayer() {
    database.selectPlayer(player);
  }
}
