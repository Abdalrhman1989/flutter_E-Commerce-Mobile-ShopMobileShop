import 'dart:convert';

import 'package:flutter_online_shop/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<LoginResponseModel> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null
        ? LoginResponseModel.fromJson(
            jsonDecode(
              prefs.getString("login_details"),
            ),
          )
        : null;
  }

  static Future<void> setLoginDetails(
    LoginResponseModel loginResponse,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(
        "login_details",
        loginResponse != null
            ? jsonEncode(
                loginResponse.toJson(),
              )
            : null);
  }

  static Future<void> logout() async {
    await setLoginDetails(null);
  }
}
