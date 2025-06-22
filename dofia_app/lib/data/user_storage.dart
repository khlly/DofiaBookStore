import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const _usernameKey = 'username';

  // (associe contact à username)
  static Future<void> saveUser(String contact, String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user:$contact', username);
  }

  // Get username from contact 
  static Future<String?> getUsernameFromContact(String contact) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user:$contact');
  }

  // save username logged
  static Future<void> saveCurrentUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  // Get username logged
  static Future<String?> getCurrentUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  // Delete session
  static Future<void> clearCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
  }
}
