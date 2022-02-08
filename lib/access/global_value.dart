import 'package:flutter/material.dart';

class GlobalString extends StatelessWidget{
  const GlobalString({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  static String usernameError = "Username cannot be blank";
  static String passwordError = "Password cannot be empty";
}