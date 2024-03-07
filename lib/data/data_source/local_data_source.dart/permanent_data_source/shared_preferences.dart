import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class AppCacheKeys {
  static const appLanguage = "appLanguage";
  static const darkMode = "darkMode";
  static const isUserLoggedIn = "isUserLoggedIn";
  static const userName = "username";
  static const password = "password";
  static const userID = "userID";
  static const isOpenedOnce = "isOpenedOnce";
}

class AppCache {
  final SharedPreferences _sharedPreferences;
  AppCache(this._sharedPreferences) {
    savedUserFirstName =
        _sharedPreferences.getString(AppCacheKeys.userName) ?? "undefined";
    savedUserID = _sharedPreferences.getInt(AppCacheKeys.userID) ?? -1;
  }
  late String savedUserFirstName;
  late int savedUserID;

  Future<void> initUserData() async {
    savedUserFirstName =
        _sharedPreferences.getString(AppCacheKeys.userName) ?? "undefined";
    savedUserID = _sharedPreferences.getInt(AppCacheKeys.userID) ?? -1;
  }

  Future<void> setUserId(int userID) async =>
      await _sharedPreferences.setInt(AppCacheKeys.userID, userID);

  Future<void> setDarkMode(bool darkMode) async =>
      await _sharedPreferences.setBool(AppCacheKeys.darkMode, darkMode);

  Future<void> setIsOpenedOnce(bool isOpenedOnce) async =>
      await _sharedPreferences.setBool(AppCacheKeys.isOpenedOnce, isOpenedOnce);

  int get getUserId => _sharedPreferences.getInt(AppCacheKeys.userID) ?? -1;

  bool get getDarkMode =>
      _sharedPreferences.getBool(AppCacheKeys.darkMode) ?? false;

  void setUserData({
    required String username,
    required String password,
    required bool isLoggedIn,
    required int userID,
  }) async {
    _sharedPreferences.setString(AppCacheKeys.userName, username);
    _sharedPreferences.setString(AppCacheKeys.password, password);
    _sharedPreferences.setBool(AppCacheKeys.isUserLoggedIn, isLoggedIn);
    _sharedPreferences.setInt(AppCacheKeys.userID, userID);
    savedUserID = userID;
  }

  String get getUserFirstName => savedUserFirstName;

  void setIsUserLoggedIn(bool value) =>
      _sharedPreferences.setBool(AppCacheKeys.isUserLoggedIn, value);

  bool getIsUserLoggedIn() =>
      _sharedPreferences.getBool(AppCacheKeys.isUserLoggedIn) ?? false;

  String getUsernamePreference() =>
      _sharedPreferences.getString(AppCacheKeys.userName) ?? "";

  int getUserIDPreference() =>
      _sharedPreferences.getInt(AppCacheKeys.userID) ?? -1;

  String getPasswordPreference() =>
      _sharedPreferences.getString(AppCacheKeys.password) ?? "";

  bool getIsOpenedOnce() =>
      _sharedPreferences.getBool(AppCacheKeys.isOpenedOnce) ?? false;

  void logOutUser() {
    _sharedPreferences.remove(AppCacheKeys.userName);
    _sharedPreferences.remove(AppCacheKeys.password);
    _sharedPreferences.remove(AppCacheKeys.isUserLoggedIn);
  }
}