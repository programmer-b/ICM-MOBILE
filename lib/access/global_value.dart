import 'package:flutter/material.dart';

class GlobalString extends StatelessWidget{
  const GlobalString({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  static String usernameError = "Username cannot be blank.";
  static String passwordError = "Password cannot be blank.";
  static String token = "";
  static String username = "";
}

class GlobalBool extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  static bool hasPasswordError = false;
  static bool hasUsernameError = false;
}