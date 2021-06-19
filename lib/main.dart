import 'dart:convert';

import 'package:avalon/screens/gameplay_page.dart';
import 'package:avalon/screens/welcome_page.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/main_page.dart';
import './screens/settings_page.dart';
import './screens/lobby_page.dart';
import 'package:provider/provider.dart';
import 'models/application_state.dart';
import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AvalonApp());
}

class AvalonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ApplicationState()),
        ChangeNotifierProvider(create: (context) => RealTimeDataBase())
      ],
      child: MaterialApp(
        title: "Avalon",
        home: MaterialApp(routes: {
          '/': (context) => WelcomePage(),
          '/main': (context) => MainPage(),
          '/lobby': (context) => LobbyPage(),
          '/settings': (context) => SettingsPage(),
          '/gameplay': (context) => GameplayPage()
        }),
      ),
    );
  }
}
