class LoginService {
  static final LoginService _loginService = new LoginService._internal();

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
}

enum Role { USER, ADMIN }
