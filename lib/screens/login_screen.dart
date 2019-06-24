import 'package:attendance/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                CustomTextFormField(validator: _inputValidator),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  validator: _inputValidator,
                  obscureText: true,
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
                    onPressed: () => null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ]),
            )),
      ),
    );
  }

  String _inputValidator(value) {
    if (value.isEmpty) {
      return 'Enter some text';
    }
    return null;
  }
}
