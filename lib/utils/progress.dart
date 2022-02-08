import 'package:flutter/material.dart';

class progress extends StatelessWidget{

  static showProgressDialog(BuildContext context, String title) {
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text(title)),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
}

  @override
  Widget build(BuildContext context
      ) {
    // TODO: implement build
    throw UnimplementedError();
  }
}