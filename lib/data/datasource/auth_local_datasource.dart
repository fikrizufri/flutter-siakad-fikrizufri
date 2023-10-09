import 'package:flutter_siakad/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<bool> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('auth', data.toJson());
    return result;
  }

  Future<bool> remoteAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.remove('auth');
    return result;
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';

    if (jsonString.isEmpty) {
      return '';
    }
    final authModel = AuthResponseModel.fromJson(jsonString);
    return authModel.jwtToken;
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final authString = pref.getString('auth') ?? '';

    return authString.isEmpty;
  }

  Future<User> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';

    final authModel = AuthResponseModel.fromJson(jsonString);
    return authModel.user;
  }
}
