import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 500,
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Hello user")),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
                                  minimumSize: Size(250.0, 50.0)),
                              child: Text("Create Lobby"),
                              onPressed: () {
                                Navigator.pushNamed(context, '/lobby');
                              })),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
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
                              onPressed: () => {navigateToSettings})),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
                                  minimumSize: Size(250.0, 50.0)),
                              child: Text("Exit"),
                              onPressed: () => {exit})),
                    ],
                  ),
                ))));
  }

  enterLobby() {}
  navigateToSettings() {}
  exit() {}
}
