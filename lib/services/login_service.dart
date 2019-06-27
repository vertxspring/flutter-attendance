import 'dart:convert';

import 'package:attendance/models/api-response.dart';

import './networking_service.dart';
import '../helpers/jwt-parser.dart' as jwtParser;

class LoginService {
  final NetworkService networkService = NetworkService();
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
    var response = await networkService.post(
        'token/generate-token', {'username': username, 'password': password});

    if (response.statusCode == 200) {
      _token = json.decode(response.body)['token'];
      networkService.jwt = _token;
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
