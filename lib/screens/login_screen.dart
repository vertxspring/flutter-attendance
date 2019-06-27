import 'package:attendance/models/api-response.dart';
import 'package:attendance/services/login_service.dart';
import 'package:attendance/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

final LoginService loginService = LoginService();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(height);
    double topPadding;
    if (height > 450) {
      topPadding = height * 0.2;
    } else {
      topPadding = height * 0.1;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        color: Colors.indigo,
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(top: topPadding, left: 50, right: 50),
              child: ListView(children: [
                CustomTextFormField(
                    validator: _inputValidator,
                    controller: usernameController,
                    hint: 'Username'),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  validator: _inputValidator,
                  obscureText: true,
                  controller: passwordController,
                  hint: 'Password',
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                    color: Colors.white,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo,
                      ),
                    ),
                    onPressed: () => attemptLogin(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ]),
            )),
      ),
    );
  }

  Future<void> attemptLogin() async {
    ApiResponse response = await loginService.getToken(
        usernameController.text, passwordController.text);
    switch (response) {
      case ApiResponse.SUCCESS:
        {
          Role role = loginService.role;
          if (role == Role.ADMIN) {
            Navigator.of(context).pushReplacementNamed('/admin');
          } else {
            Navigator.of(context).pushReplacementNamed('/request-approval');
          }
          break;
        }
      case ApiResponse.UNAUTHORIZED:
        {
          break;
        }
      case ApiResponse.ERROR:
        {
          break;
        }
    }
  }

  String _inputValidator(value) {
    if (value.isEmpty) {
      return 'Enter some text';
    }
    return null;
  }
}
