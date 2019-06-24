import 'package:flutter/material.dart';

typedef String StringCallback(String input);

class CustomTextFormField extends StatelessWidget {
  final StringCallback validator;
  final bool obscureText;

  CustomTextFormField({this.validator, this.obscureText: false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Username',
          hintStyle: TextStyle(
            color: Colors.grey.shade700,
          )),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter some text';
        }
        return null;
      },
    );
  }
}
