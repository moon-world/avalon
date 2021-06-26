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
      'enterAccountName': 'Enter your account name',
      'enterEmail': 'Enter your email',
      'next': 'NEXT',
      'signWithEmail': 'Sign in with email',
      'signIn': 'Sign In',
      'password': 'Password',
      'enterFirst': 'Please log in first',
      'enterYourPassword': 'Enter your password',
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
      'startVote': 'Start voting',
      'mordredWon': 'Mordred has won!',
      'arthurWon': 'Arthur has won!',
      'lobbyNumber': 'Lobby number:',
      'gameStarted': 'Game is started!',
      'assassinCanTry': 'Assassin can try guess who is Merlin',
      'questsSuccess': '3 quests succeedeed!',
      'cancel': 'Cancel',
      'save': 'Save',
      'lobyHasBeenClosed': 'Lobby has been closed',
      'failedEnteringLobby': 'Failed entering lobby',
      'language': 'Language',
      'about': 'About',
      'nickname': 'NickName',
      'invalidMail': 'Invalid email',
      'failedtosignin': 'Failed to sign in',
      'failedtocreateaccount': 'Failed to create account'
    },
    'ru': {
      'title': 'Авалон',
      'login': 'Войти',
      'enterAvalon': 'Войти в Авалон',
      'welcomeAvalon': 'Добро пожаловать в Авалон',
      'enterAccountName': 'Введите имя вашей учетной записи',
      'enterEmail': 'Введите ваш мейл',
      'next': 'СЛЕДУЮЩИЙ',
      'signWithEmail': 'Войти с мейлом',
      'signIn': 'Войти в систему',
      'password': 'Пароль',
      'enterFirst': 'Пожалуйста войдите!',
      'enterYourPassword': 'Введите свой пароль',
      'logout': 'ВЫХОД',
      'createLobbby': 'Создать комнату',
      'enterLobbyNumber': 'Введите номер комнаты',
      'settings': 'Настройки',
      'exit': 'Выход',
      'hello': 'Привет',
      'noSuchRoom': 'Такой комнаты не существует',
      'fullRoom': 'Комната полная!',
      'players': 'Игроки',
      'numberOfPlayers': 'Число игроков:',
      'startGame': 'Начать игру',
      'enterGame': 'Войти в игру',
      'checkQuest': 'Проверить квест',
      'nextQuest': 'Следующий квест',
      'startVote': 'Начать голосование',
      'mordredWon': 'Mordred победил!',
      'arthurWon': 'Arthur победил!',
      'lobbyNumber': 'Номер комнаты:',
      'gameStarted': 'Игра началась!',
      'assassinCanTry': 'Assassin должен попытаться угадать кто Merlin',
      'questsSuccess': 'Силы света победили в 3ех квестах!',
      'cancel': 'Отмена',
      'save': '',
      'lobyHasBeenClosed': 'Лобби было закрыто',
      'failedEnteringLobby': 'Не удалось войти в лобби',
      'language': 'Язык',
      'about': 'О',
      'nickname': 'прозвище',
      'invalidMail': 'Неверный адрес электронной почты',
      'failedtosignin': 'Не удалось войти',
      'failedtocreateaccount': 'Не удалось создать учетную запись'
    },
    'he': {
      'title': 'אבאלון',
      'login': 'התחבר',
      'enterAvalon': 'כניסה לאבאלון',
      'welcomeAvalon': 'ברוכים הבאים לאבאלון',
      'enterAccountName': 'הזן את שם החשבון שלך',
      'enterEmail': 'הכנס מייל',
      'next': 'הבא',
      'signWithEmail': 'התחבר באמצעות המייל',
      'signIn': 'התחבר',
      'password': 'סיסמא',
      'enterFirst': 'נא להתחבר',
      'enterYourPassword': 'הכנס את הסיסמה שלך',
      'logout': 'התנתק',
      'createLobbby': 'צור לובי',
      'enterLobbyNumber': 'הכנס מספר חדר',
      'settings': 'הגדרות',
      'exit': 'יציאה',
      'hello': 'שלום',
      'noSuchRoom': 'לא קיים חדר עם מספר זה',
      'fullRoom': '!החדר מלא',
      'players': 'שחקנים',
      'numberOfPlayers': ':מספר שחקנים',
      'startGame': 'התחל משחק',
      'enterGame': 'היכנס למשחק',
      'checkQuest': 'בדוק משימה',
      'nextQuest': 'משימה הבאה',
      'startVote': 'התחל הצבעה',
      'mordredWon': '!מורדר ניצח',
      'arthurWon': '!ארטור ניצח',
      'lobbyNumber': 'מספר חדר',
      'gameStarted': '!המשחק התחיל',
      'assassinCanTry': '!המתנקש יכול לנסות לנחש מי הוא המרלין',
      'questsSuccess': '!3 משימות הצליחו',
      'cancel': 'ביטול',
      'save': 'שמירה',
      'lobyHasBeenClosed': 'הלובי נסגר',
      'failedEnteringLobby': 'הכניסה ללובי נכשלה',
      'language': 'שפה',
      'about': 'אודות',
      'nickname': 'שם חיבה',
      'invalidMail': 'כתובת אימייל לא חוקית',
      'failedtosignin': 'הכניסה נכשלה',
      'failedtocreateaccount': 'כישלון בעת ניסיון יצירת משתמש'
    }
  };

String get invalidMail {
    return _localizedValues[locale.languageCode]!['invalidMail']!;
  }
  String get failedtosignin {
    return _localizedValues[locale.languageCode]!['failedtosignin']!;
  }

  String get nickname {
    return _localizedValues[locale.languageCode]!['nickname']!;
  }

  String get about {
    return _localizedValues[locale.languageCode]!['about']!;
  }

  String get language {
    return _localizedValues[locale.languageCode]!['language']!;
  }

  String get failedEnteringLobby {
    return _localizedValues[locale.languageCode]!['failedEnteringLobby']!;
  }

  String get lobyHasBeenClosed {
    return _localizedValues[locale.languageCode]!['lobyHasBeenClosed']!;
  }

  String get save {
    return _localizedValues[locale.languageCode]!['save']!;
  }

  String get enterYourPassword {
    return _localizedValues[locale.languageCode]!['enterYourPassword']!;
  }

  String get enterAccountName {
    return _localizedValues[locale.languageCode]!['enterAccountName']!;
  }

  String get assassinCanTry {
    return _localizedValues[locale.languageCode]!['assassinCanTry']!;
  }

  String get questsSuccess {
    return _localizedValues[locale.languageCode]!['questsSuccess']!;
  }

  String get cancel {
    return _localizedValues[locale.languageCode]!['cancel']!;
  }

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

  String get lobbyNumber {
    return _localizedValues[locale.languageCode]!['lobbyNumber']!;
  }

  String get mordredWon {
    return _localizedValues[locale.languageCode]!['mordredWon']!;
  }

  String get arthurWon {
    return _localizedValues[locale.languageCode]!['arthurWon']!;
  }

  String get gameStarted {
    return _localizedValues[locale.languageCode]!['gameStarted']!;
  }

  String get failedtocreateaccount {
    return _localizedValues[locale.languageCode]!['failedtocreateaccount']!;
  }
}
