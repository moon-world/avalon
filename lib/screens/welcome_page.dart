import 'package:avalon/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? _errorText;
  bool _isDisabled = true;

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
                child: Image(
                  image: AssetImage('assets/images/gates_1.png'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Welcome to Avalon",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CinzelDecorative'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    onSubmitted: (String text) {
                      setState(() {
                        if (text.length < 4) {
                          _errorText = "Name must be longer then 3 characters.";
                          _changeButtonState(true);
                        } else {
                          user.username = text;
                          _changeButtonState(false);
                          _errorText = null;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your name",
                      errorText: _getErrorText(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: _isDisabled ? null : _navigate,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal, minimumSize: Size(250.0, 50.0)),
                    child: Text("Enter Avalon"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _getErrorText() {
    return _errorText;
  }

  void _changeButtonState(bool state) {
    _isDisabled = state;
  }

  void _navigate() {
    Navigator.pushNamed(context, '/main');
  }
}
