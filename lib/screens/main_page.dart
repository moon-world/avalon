import 'package:avalon/models/application_state.dart';
import 'package:avalon/models/user_model.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ApplicationState>();
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
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan.shade400,
                      minimumSize: Size(250.0, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text("Create Lobby"),
                    onPressed: () {
                      createLobby();
                    },
                  ),
                ),
                EnterLobbyPopup(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.cyan.shade400,
                          minimumSize: Size(250.0, 50.0)),
                      child: Text("Settings"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.cyan.shade400,
                          minimumSize: Size(250.0, 50.0)),
                      child: Text("Exit"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
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
      var rdb = new RealTimeDataBase();
      UserModel user = new UserModel();
      rdb.CreateLobby(user);
    } catch (e) {
      print(e);
    }

    Navigator.pushNamed(context, '/lobby');
  }

  enterLobby() {}
  navigateToSettings() {}
  exit() {}
}

class EnterLobbyPopup extends StatefulWidget {
  @override
  _EnterLobbyPopup createState() => _EnterLobbyPopup();
}

class _EnterLobbyPopup extends State<EnterLobbyPopup> {
  final TextEditingController _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.cyan.shade400, minimumSize: Size(250.0, 50.0)),
          child: Text("Enter Lobby"),
          onPressed: () => {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Enter Room Pass'),
                    content: const Text('Enter numbers'),
                    actions: <Widget>[
                      TextFormField(
                        controller: _textEditController,
                        validator: (value) {
                          return value!.isEmpty ? null : "Invalid";
                        },
                        decoration:
                            InputDecoration(hintText: "Enter Room Number"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text('Cancel'),
                        ), // Need to change this~
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Enter Room'),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Enter Room'),
                        ),
                      ),
                    ],
                  ),
                ),
              }),
    );
  }
}
