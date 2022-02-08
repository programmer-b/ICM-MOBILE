import 'package:flutter/material.dart';

class snack_bar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    throw UnimplementedError();
  }
  static showSnackBar(BuildContext context,String text){
    final snackBar = SnackBar(content: Text(text),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}