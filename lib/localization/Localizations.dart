import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';

class AvalonLocalizationsDelegate
    extends LocalizationsDelegate<AvalonLocalizations> {
  const AvalonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ru', 'he'].contains(locale.languageCode);

  @override
  Future<AvalonLocalizations> load(Locale locale) {
    return SynchronousFuture<AvalonLocalizations>(AvalonLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AvalonLocalizations> old) =>
      false;
}

class AvalonLocalizations {
  AvalonLocalizations(this.locale);

  final Locale locale;

  static AvalonLocalizations of(BuildContext context) {
    return Localizations.of<AvalonLocalizations>(context, AvalonLocalizations)!;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Avalon',
      'login': 'Log In',
      'enterAvalon': 'Enter Avalon',
      'welcomeAvalon': 'Welcome to Avalon',
      'enterEmail': 'Enter your email',
      'next': 'NEXT',
      'signWithEmail': 'Sign in with email',
      'signIn': 'Sign In',
      'password': 'Password',
      'enterFirst': 'Please log in first',
      'logout': 'LOGOUT',
      'createLobbby': 'Create Lobby',
      'enterLobbyNumber': 'Enter Room Number',
      'settings': 'Settings',
      'exit': 'Exit',
      'hello': 'Hello',
      'noSuchRoom': 'There is no room with number',
      'fullRoom': 'The room is full!',
      'players': 'Players',
      'numberOfPlayers': 'Number of players:',
      'startGame': 'Start game',
      'enterGame': 'Enter game',
      'checkQuest': 'Check quest',
      'nextQuest': 'Next quest',
      'startVote': 'Start voting'
    },
    'ru': {
      'title': 'Авалон',
      'login': 'Войти',
      'enterAvalon': 'Войти в Авалон',
      'welcomeAvalon': 'Добро пожаловать в Авалон',
      'enterEmail': 'Введите ваш мейл',
      'next': 'СЛЕДУЮЩИЙ',
      'signWithEmail': 'Войти с мейлом',
      'signIn': 'Войти в систему',
      'password': 'Пароль',
      'enterFirst': 'Пожалуйста войдите!',
      'logout': 'ВЫХОД',
      'createLobbby': 'Создать комнату',
      'enterLobbyNumber': 'Введите номер комнаты',
      'settings': 'Настройки',
      'exit': 'Выход',
      'hello': 'Привет',
      'noSuchRoom': 'There is no room with number',
      'fullRoom': 'The room is full!',
      'players': 'Игроки',
      'numberOfPlayers': 'Number of players:',
      'startGame': 'Начать игру',
      'enterGame': 'Войти в игру',
      'checkQuest': 'Check quest',
      'nextQuest': 'Next quest',
      'startVote': 'Start voting'
    },
    'he': {}
  };

  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }

  String get login {
    return _localizedValues[locale.languageCode]!['login']!;
  }

  String get enterAvalon {
    return _localizedValues[locale.languageCode]!['enterAvalon']!;
  }

  String get welcomeAvalon {
    return _localizedValues[locale.languageCode]!['welcomeAvalon']!;
  }

  String get enterEmail {
    return _localizedValues[locale.languageCode]!['enterEmail']!;
  }

  String get next {
    return _localizedValues[locale.languageCode]!['next']!;
  }

  String get signWithEmail {
    return _localizedValues[locale.languageCode]!['signWithEmail']!;
  }

  String get signIn {
    return _localizedValues[locale.languageCode]!['signIn']!;
  }

  String get password {
    return _localizedValues[locale.languageCode]!['password']!;
  }

  String get enterFirst {
    return _localizedValues[locale.languageCode]!['enterFirst']!;
  }

  String get logout {
    return _localizedValues[locale.languageCode]!['logout']!;
  }

  String get createLobbby {
    return _localizedValues[locale.languageCode]!['createLobbby']!;
  }

  String get enterLobbyNumber {
    return _localizedValues[locale.languageCode]!['enterLobbyNumber']!;
  }

  String get settings {
    return _localizedValues[locale.languageCode]!['settings']!;
  }

  String get exit {
    return _localizedValues[locale.languageCode]!['exit']!;
  }

  String get hello {
    return _localizedValues[locale.languageCode]!['hello']!;
  }

  String get noSuchRoom {
    return _localizedValues[locale.languageCode]!['noSuchRoom']!;
  }

  String get fullRoom {
    return _localizedValues[locale.languageCode]!['fullRoom']!;
  }

  String get players {
    return _localizedValues[locale.languageCode]!['players']!;
  }

  String get numberOfPlayers {
    return _localizedValues[locale.languageCode]!['numberOfPlayers']!;
  }

  String get startGame {
    return _localizedValues[locale.languageCode]!['startGame']!;
  }

  String get enterGame {
    return _localizedValues[locale.languageCode]!['enterGame']!;
  }

  String get checkQuest {
    return _localizedValues[locale.languageCode]!['checkQuest']!;
  }

  String get nextQuest {
    return _localizedValues[locale.languageCode]!['nextQuest']!;
  }

  String get startVote {
    return _localizedValues[locale.languageCode]!['startVote']!;
  }
}
