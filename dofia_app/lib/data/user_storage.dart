import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const _usernameKey = 'username';
  static const _genderKey = 'gender';
  static const _dobKey = 'dob';
  static const _phoneKey = 'phone';
  static const _emailKey = 'email';
  static const _addressKey = 'address';

  // Associe un username à un contact
  static Future<void> saveUser(String contact, String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user:$contact', username);
  }

  static Future<String?> getUsernameFromContact(String contact) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user:$contact');
  }

  static Future<void> saveCurrentUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  static Future<String?> getCurrentUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  static Future<void> saveProfileData({
    required String username,
    required String gender,
    required String dob,
    required String phone,
    required String email,
    required String address,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('profile:$username:gender', gender);
    await prefs.setString('profile:$username:dob', dob);
    await prefs.setString('profile:$username:phone', phone);
    await prefs.setString('profile:$username:email', email);
    await prefs.setString('profile:$username:address', address);
  }

  static Future<Map<String, String>> loadProfileData(String username) async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'gender': prefs.getString('profile:$username:gender') ?? '',
      'dob': prefs.getString('profile:$username:dob') ?? '',
      'phone': prefs.getString('profile:$username:phone') ?? '',
      'email': prefs.getString('profile:$username:email') ?? '',
      'address': prefs.getString('profile:$username:address') ?? '',
    };
  }

  static Future<void> clearCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.remove(_genderKey);
    await prefs.remove(_dobKey);
    await prefs.remove(_phoneKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_addressKey);
  }
}
