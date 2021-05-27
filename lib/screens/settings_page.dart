import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
            child: Scaffold(
                appBar: AppBar(title: Text("Settings")),
                body: Column(
                  children: [
                    Slider(
                      value: rating,
                      onChanged: (newRating) {
                        setState(() => rating = newRating);
                      },
                      divisions: 4,
                    )
                  ],
                ))));
  }
}
