import 'package:avalon/models/application_state.dart';
import 'package:avalon/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../src/authentication.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isDisabled = false;
  late ApplicationState appState;
  @override
  Widget build(BuildContext context) {
    appState = context.watch<ApplicationState>();
    _isDisabled = !appState.loggedIn;

    return Material(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image(
                image: AssetImage('assets/images/gates_1.png'),
              ),
            ),
            Text(
              "Welcome to Avalon",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CinzelDecorative'),
            ),
            Expanded(
              flex: 3,
              child: Consumer<ApplicationState>(
                builder: (context, appState, _) => Authentication(
                  email: appState.email,
                  loginState: appState.loginState,
                  startLoginFlow: appState.startLoginFlow,
                  verifyEmail: appState.verifyEmail,
                  signInWithEmailAndPassword:
                      appState.signInWithEmailAndPassword,
                  cancelRegistration: appState.cancelRegistration,
                  registerAccount: appState.registerAccount,
                  signOut: appState.signOut,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 25.0),
              child: ElevatedButton(
                onPressed: _isDisabled ? null : _navigate,
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal, minimumSize: Size(250.0, 50.0)),
                child: Text("Enter Avalon"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate() {
    appState.player = new Player(appState.userName!, appState.email!);
    Navigator.pushNamed(context, '/main');
  }
}
