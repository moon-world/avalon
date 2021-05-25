import 'package:flutter/material.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State {
  String dropdownValue = 'five';

  @override
  Widget build(BuildContext context) {
    return Material(
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
                ))),
                Expanded(
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: DropdownButton<String>(
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'five',
                                'six',
                                'seven',
                                'eight',
                                'nine',
                                'ten'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ))))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
