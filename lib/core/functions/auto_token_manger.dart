import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenManager {
  static const String _tokenKey = 'auth_token';

  // تخزين التوكن
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // قراءة التوكن
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // حذف التوكن (مثلاً وقت الـ logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}