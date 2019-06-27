import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/endpoint.dart' as endpoint;
import 'login_service.dart';

LoginService loginService = LoginService();

class NetworkService {
  String _jwt;

  String get jwt => _jwt;

  set jwt(String jwt) {
    _jwt = jwt;
  }

  static final NetworkService _networkService = new NetworkService._internal();

  factory NetworkService() {
    return _networkService;
  }
  NetworkService._internal();

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    String fullPath = '${endpoint.basePath}$url';
    print(fullPath);
    return await http.post(fullPath,
        body: json.encode(body), headers: getHeaders());
  }

  Future<http.Response> get(String url) async {
    return await http.get('${endpoint.basePath}/$url', headers: getHeaders());
  }

  Map<String, String> getHeaders() {
    String token = loginService.token;
    Map<String, String> headers = {'Content-Type': 'application/json'};
    if (token != null) headers['Authorization'] = 'Bearer $jwt';
    return headers;
  }
}
