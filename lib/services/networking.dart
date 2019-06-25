import 'package:http/http.dart' as http;

Future<http.Response> getToken(String username, String password) async {
  http.Response response = await http.post(
      'http://10.0.2.2:8080/token/generate-token',
      body: {'username': username, 'password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return response;
}
