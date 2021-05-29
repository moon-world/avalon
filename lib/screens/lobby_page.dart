import 'package:flutter/material.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State {
  int dropdownValue = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(title: Text("Lobby number : ")),
          body: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Number of players",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButton<int>(
                            value: dropdownValue,
                            icon: const Icon(Icons.expand_more),
                            iconSize: 34,
                            elevation: 15,
                            style: const TextStyle(
                                color: Colors.indigoAccent, fontSize: 20.0),
                            underline: Container(
                              height: 1,
                              color: Colors.indigoAccent,
                            ),
                            onChanged: (int? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <int>[
                              5,
                              6,
                              7,
                              8,
                              9,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
