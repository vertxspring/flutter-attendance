import 'dart:convert';

import 'package:attendance/models/api-response.dart';
import 'package:http/http.dart' as http;

import '../helpers/jwt-parser.dart' as jwtParser;

class LoginService {
  static final LoginService _loginService = new LoginService._internal();

  String _token;

  String get token => _token;

  Role _role;

  Role get role => _role;

  bool _isLogged;

  bool get isLogged => _isLogged;

  factory LoginService() {
    return _loginService;
  }

  bool isLoggedIn() {
    return true;
  }

  doLogin() async {
    await Future.delayed(Duration(milliseconds: 500), () => _role = Role.ADMIN);
  }

  LoginService._internal();

  Future<ApiResponse> getToken(String username, String password) async {
    http.Response response = await http.post(
        'http://10.0.2.2:8080/token/generate-token',
        body: json.encode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      _token = json.decode(response.body)['token'];
      _isLogged = true;
      if (jwtParser
          .parseJwt(_token)['scopes']
          .toString()
          .contains('ROLE_ADMIN'))
        _role = Role.ADMIN;
      else
        _role = Role.USER;

      return ApiResponse.SUCCESS;
    } else if (response.statusCode == 401) {
      return ApiResponse.UNAUTHORIZED;
    } else {
      return ApiResponse.ERROR;
    }
  }

  void logout() {
    _role = null;
    _token = null;
    _isLogged = false;
  }
}

enum Role { USER, ADMIN }
