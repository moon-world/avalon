import 'package:avalon/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserModel>();

    return SafeArea(
        child: Material(
            child: Container(
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Image(image: AssetImage('assets/images/gates_1.png'))),
          Expanded(
              flex: 1,
              child: Text("Welcome to Avalon",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CinzelDecorative'))),
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
                      try {
                        user.username = value;
                      } catch (e) {
                        print(e);
                      }
                    })),
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
                      primary: Colors.teal, minimumSize: Size(250.0, 50.0)),
                  child: Text("Enter Avalon"),
                )),
          )
        ],
      ),
    )));
  }
}
