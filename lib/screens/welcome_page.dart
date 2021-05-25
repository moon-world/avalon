import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
            child: Container(
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Image(image: AssetImage('assets/images/gates_1.png'))),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your name"),
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  onSubmitted: (value) {
                    name = value;
                  }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal, minimumSize: Size(150.0, 50.0)),
                  child: Text("Enter Avalon"),
                )),
          )
        ],
      ),
    )));
  }
}
