import 'package:avalon/localization/Localizations.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double rating = 0;

  final List<String> languages = ['Hebrew', 'English', 'Russian'];
  String dropDownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(title: Text(AvalonLocalizations.of(context).settings)),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Slider(
                  value: rating,
                  onChanged: (newRating) {
                    setState(() => rating = newRating);
                  },
                  divisions: 4,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.cyan.shade400,
                      minimumSize: Size(250.0, 50.0)),
                  onPressed: () {
                    print('Change Language');
                  },
                  child: Text(AvalonLocalizations.of(context).language),
                ),
                DropdownButton<String>(
                  value: dropDownValue,
                  icon: const Icon(Icons.arrow_drop_down_circle),
                  iconSize: 34,
                  elevation: 15,
                  iconEnabledColor: Colors.cyan.shade400,
                  isExpanded: true,
                  style: const TextStyle(
                      color: Colors.indigoAccent, fontSize: 20.0),
                  underline: Container(
                    height: 0.5,
                    color: Colors.indigoAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                  items: <String>['Hebrew', 'English', 'Russian', 'Ukraine']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.cyan.shade400,
                      minimumSize: Size(250.0, 50.0)),
                  onPressed: () {
                    print('Developed by Anton Ruvinsky and Amit Dahari');
                  },
                  child: Text(AvalonLocalizations.of(context).about),
                )
              ]),
        ),
      ),
    );
  }
}
