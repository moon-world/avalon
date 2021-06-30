import 'package:avalon/localization/Localizations.dart';
import 'package:avalon/models/application_state.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:avalon/src/widgets.dart' as widgets;

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  final TextEditingController _textEditController = TextEditingController();
  late RealTimeDataBase database;
  late ApplicationState appState;
  final ButtonStyle buttonsStyle = ElevatedButton.styleFrom(
      primary: Colors.blueAccent.shade100,
      minimumSize: Size(250.0, 50.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ));
  @override
  Widget build(BuildContext context) {
    appState = context.watch<ApplicationState>();
    database = context.watch<RealTimeDataBase>();
    var username = appState.userName;

    return SafeArea(
      child: Material(
        child: Center(
          child: Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Hello $username",
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'CinzelDecorative'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: buttonsStyle,
                    child: Text(AvalonLocalizations.of(context).createLobbby),
                    onPressed: () {
                      createLobby();
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0,
                          child: TextFormField(
                            controller: _textEditController,
                            validator: (value) {
                              return value!.isEmpty ? null : "Invalid";
                            },
                            decoration: InputDecoration(
                                hintText: AvalonLocalizations.of(context)
                                    .enterLobbyNumber),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.forward),
                            onPressed: () {
                              enterLobby();
                            }),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      style: buttonsStyle,
                      child: Text(AvalonLocalizations.of(context).exit),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      style: buttonsStyle,
                      child: Text(AvalonLocalizations.of(context).about),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text('Cancel'),
                                ), // Need to change this~
                              ),
                            ],
                            title: Text(
                              AvalonLocalizations.of(context).about,
                            ),
                            content: Text(
                                "Developed by Anton Ruvinsky and Amit Dahari"),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createLobby() {
    try {
      widgets.currentIndex = 0;
      database.player = appState.player!;
      appState.player!.isLeader = true;
      if (database.createLobby(appState.player!)) {
        Navigator.pushNamed(context, '/lobby');
      } else {
        // TODO: show error message if lobby creation failed
      }
    } catch (e) {
      print(e);
    }
  }

  enterLobby() async {
    appState.player!.isLeader = false;
    database.player = appState.player!;
    String result =
        await database.enterLobby(_textEditController.text, appState.player!);
    switch (result) {
      case 'Entered':
        Navigator.pushNamed(context, '/lobby');
        break;
      case 'Lobby is full!':
        var lobbyPopup = new EnterLobbyPopup(LobbyState.maxPlayers);
        showDialog(
            context: context, builder: (BuildContext context) => lobbyPopup);
        break;
      case 'There is no such room.':
        var lobbyPopup = new EnterLobbyPopup(LobbyState.notExist);
        showDialog(
            context: context, builder: (BuildContext context) => lobbyPopup);
        break;
      case 'Game is Started':
        var lobbyPopup = new EnterLobbyPopup(LobbyState.started);
        showDialog(
            context: context, builder: (BuildContext context) => lobbyPopup);
        break;
      default:

      // TODO: implement pop up with message to User
    }
  }

  navigateToSettings() {}
  exit() {}
}

enum LobbyState { maxPlayers, notExist, failed, started, none }

class EnterLobbyPopup extends StatelessWidget {
  final LobbyState lobbyState;

  EnterLobbyPopup(this.lobbyState);
  @override
  Widget build(BuildContext context) {
    switch (lobbyState) {
      case LobbyState.maxPlayers:
        return AlertDialog(
          title: Text(AvalonLocalizations.of(context).fullRoom),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Cancel'),
              ), // Need to change this~
            ),
          ],
        );
      case LobbyState.notExist:
        return AlertDialog(
          title: Text(AvalonLocalizations.of(context).noSuchRoom),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Cancel'),
              ), // Need to change this~
            ),
          ],
        );
      case LobbyState.started:
        return AlertDialog(
          title: Text(AvalonLocalizations.of(context).gameStarted),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Cancel'),
              ), // Need to change this~
            ),
          ],
        );
      default:
        return AlertDialog(
          title: Text(AvalonLocalizations.of(context).failedEnteringLobby),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Close")),
          ],
        );
    }
  }
}
