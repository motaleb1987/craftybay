import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/shared/data/models/user_model.dart';

class AuthController {
  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user';

  static String? accessToken;
  static UserModel? userModel;

  // user data saved to SharedPreferences
  static Future<void> saveUserData(String token, UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
    await prefs.setString(_userDataKey, jsonEncode(user.toJson()));
    accessToken = token;
    userModel = user;
  }

  // user data load from  SharedPreferences

  static Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString(_accessTokenKey);
    userModel = UserModel.fromJson(jsonDecode(prefs.getString(_userDataKey)!));
  }

  // user login check
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isAvailableUser = await prefs.getString(_accessTokenKey) != null;
    return isAvailableUser;
  }

  // user data from SharedPreference

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_userDataKey);
    accessToken = null;
    userModel = null;
  }
}
