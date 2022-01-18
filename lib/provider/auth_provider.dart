import 'package:flutter/material.dart';
import 'package:loyalty_project/models/user_model.dart';
import 'package:loyalty_project/service/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../main.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  SharedPreferences localStorage;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    int id,
    String firstName,
    String lastName,
    String birthDate,
    String phone,
    String gender,
    String plainPassword,
    bool agreement1,
    String profilePhotoUrl,
    String token,
    String name,
    String username,
    String email,
  }) async {
    try {
      UserModel user = await AuthService().register(
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        phone: phone,
        gender: gender,
        plainPassword: plainPassword,
        agreement1: agreement1,
        name: name,
        username: username,
        email: email,
      );
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String username,
    String password,
  }) async {
    try {
      localStorage = await MyApp.init();
      String login =
          await AuthService().login(username: username, password: password);
      localStorage.setString('token', login);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
