import 'package:avalon/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserModel>();
    var username = user.username;

    return SafeArea(
        child: Material(
            child: Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 500,
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("Hello $username",
                                  style: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'CinzelDecorative'))),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan.shade400,
                                      minimumSize: Size(250.0, 50.0)),
                                  child: Text("Create Lobby"),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/lobby');
                                  })),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan.shade400,
                                      minimumSize: Size(250.0, 50.0)),
                                  child: Text("Enter Lobby"),
                                  onPressed: () => {enterLobby})),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan.shade400,
                                      minimumSize: Size(250.0, 50.0)),
                                  child: Text("Settings"),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/settings');
                                  })),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan.shade400,
                                      minimumSize: Size(250.0, 50.0)),
                                  child: Text("Exit"),
                                  onPressed: () => {exit})),
                        ],
                      ),
                    )))));
  }

  enterLobby() {}
  navigateToSettings() {}
  exit() {}
}
