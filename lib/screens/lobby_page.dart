import 'package:avalon/models/application_state.dart';
import 'package:avalon/models/game_session.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:avalon/src/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State {
  late int dropdownValue;
  bool isDisabled = false;
  //late RealTimeDataBase database;
  late ApplicationState appState;
  @override
  Widget build(BuildContext context) {
    appState = context.watch<ApplicationState>();
    //dropdownValue = database.gameSession!.numberOfPlayers;
    return Consumer<RealTimeDataBase>(builder: (context, database, child) {
      if (database.gameSession != null) {
        return SafeArea(
          child: Material(
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                      icon:
                          Icon(Icons.keyboard_arrow_left, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                        database.exitLobby(appState.player!);
                      }),
                  title: Text(
                      "Lobby number : ${database.gameSession!.sessionId}")),
              body: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "Number of players",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                          if (appState.player!.isLeader)
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: DropdownButton<int>(
                                    value:
                                        database.gameSession!.numberOfPlayers,
                                    icon: const Icon(Icons.expand_more),
                                    iconSize: 34,
                                    elevation: 15,
                                    style: const TextStyle(
                                        color: Colors.indigoAccent,
                                        fontSize: 20.0),
                                    underline: Container(
                                      height: 1,
                                      color: Colors.indigoAccent,
                                    ),
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                        database.gameSession!.numberOfPlayers =
                                            dropdownValue;
                                        database.updateGameSession();
                                      });
                                    },
                                    items: <int>[
                                      5,
                                      6,
                                      7,
                                      8,
                                      9,
                                      10,
                                    ].map<DropdownMenuItem<int>>((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text('$value'),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          if (!appState.player!.isLeader)
                            Expanded(
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                        '${database.gameSession!.numberOfPlayers}')),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: PlayersTable(
                            players: database.gameSession!.players!)),
                    Expanded(
                      flex: 3,
                      child: CharactersCarousel(
                          charactersList: database.charactersList,
                          database: database,
                          isLeader: appState.player!.isLeader),
                    ),
                    Expanded(
                        flex: 2,
                        child: ChosenCharactersTable(database: database)),
                    if (appState.player!.isLeader)
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: !database.gameIsReady()
                                ? () => startGame(database)
                                : null,
                            child: Text("Start Game")),
                      ),
                    if (!appState.player!.isLeader)
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: !database.gameSession!.started
                                ? null
                                : () => startGameAsGuest(database),
                            child: Text("Enter Game")),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  startGame(RealTimeDataBase database) {
    database.startGame();
    Navigator.pushNamed(context, '/gameplay');
  }

  startGameAsGuest(RealTimeDataBase database) {
    try {
      Navigator.pushNamed(context, '/gameplay');
    } catch (e) {
      print(e);
    }
  }
}
