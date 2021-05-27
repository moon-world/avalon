import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String _username = "";

  String get username {
    return _username;
  }

  set username(String user) {
    _username = user;
    notifyListeners();
  }
}
