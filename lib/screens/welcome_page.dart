import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(flex: 6, child: Placeholder()),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter your name"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {
                    enterAvalon;
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal, minimumSize: Size(150.0, 50.0)),
                  child: Text("Enter Avalon"),
                )),
          )
        ],
      ),
    );
  }

  void enterAvalon() {}
}
