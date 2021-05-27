import 'package:avalon/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import './screens/main_page.dart';
import './screens/settings_page.dart';
import './screens/lobby_page.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';

void main() => runApp(AvalonApp());

class AvalonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MaterialApp(
          title: "Avalon",
          home: MaterialApp(routes: {
            '/': (context) => WelcomePage(),
            '/main': (context) => MainPage(),
            '/lobby': (context) => LobbyPage(),
            '/settings': (context) => SettingsPage()
          }),
        ));
  }
}
