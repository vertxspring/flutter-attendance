import 'package:attendance/models/user.dart';

class StorageService {
  void save(String key, String value) {}

  Future<String> get(String key) async {
    await Future.delayed(Duration(seconds: 1));
    return "test";
  }

  Future<User> getLoggedInUser() async {
    await Future.delayed(Duration(milliseconds: 5000));
    // return User("Shravan", Role.ADMIN);
    return null;
  }
}
