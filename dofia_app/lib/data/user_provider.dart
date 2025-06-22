// user_provider.dart
import 'package:dofia_the_book/data/user_storage.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _username;

  String? get username => _username;
  bool get isLoggedIn => _username != null;

  void login(String name) {
    _username = name;
    notifyListeners();
  }

  void logout() {
    _username = null;
    notifyListeners();
  }

  Future<void> loadUserFromPrefs() async {
    final storedUsername = await UserStorage.getCurrentUsername();
    if (storedUsername != null) {
      login(storedUsername);
    }
  }

  Future<void> logoutAndClearPrefs() async {
    await UserStorage.clearCurrentUser();
    logout();
}

}
