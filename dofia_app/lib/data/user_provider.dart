// user_provider.dart
import 'package:dofia_the_book/data/user_storage.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _username;
  String? _gender;
  String? _dob;
  String? _phone;
  String? _email;
  String? _address;

// Getters pour accéder aux données
  bool get isLoggedIn => _username != null;
  String? get username => _username; // <= ceci doit exister
  String? get gender => _gender;
  String? get dob => _dob;
  String? get phone => _phone;
  String? get email => _email;
  String? get address => _address;

// Nouvelle méthode
  void updateProfile({
    required String name,
    required String gender,
    required String dob,
    required String phone,
    required String email,
    required String address,
  }) {
    _username = name;
    _gender = gender;
    _dob = dob;
    _phone = phone;
    _email = email;
    _address = address;

    UserStorage.saveProfileData(
      username: name,
      gender: gender,
      dob: dob,
      phone: phone,
      email: email,
      address: address,
    );

    notifyListeners();
  }

  Future<void> login(String name) async {
    _username = name;
    await UserStorage.saveCurrentUsername(name);
    final profile = await UserStorage.loadProfileData(name);
    _gender = profile['gender'];
    _dob = profile['dob'];
    _phone = profile['phone'];
    _email = profile['email'];
    _address = profile['address'];
    notifyListeners();
  }

  void logout() {
    _username = null;
    notifyListeners();
  }

  Future<void> loadUserFromPrefs() async {
    final storedUsername = await UserStorage.getCurrentUsername();
    if (storedUsername != null) {
      final profile = await UserStorage.loadProfileData(storedUsername);
      _username = storedUsername;
      _gender = profile['gender'];
      _dob = profile['dob'];
      _phone = profile['phone'];
      _email = profile['email'];
      _address = profile['address'];
      notifyListeners();
    }
  }

  Future<void> logoutAndClearPrefs() async {
    await UserStorage.clearCurrentUser();
    logout();
  }
}
