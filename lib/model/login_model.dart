import 'dart:convert';

import 'package:crackerit_02/access/global_value.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crackerit_02/utils/snack_bar.dart';
import 'package:crackerit_02/utils/progress.dart';

class API extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  static Future loginMethod(String username,String password, BuildContext context) async {
    progress.showProgressDialog(context, "Processing data ...");
    var res = await http.post(Uri.parse('http://api.crackit.tk/v1/auth/login'),
        body: {"username": username, "password": password});
    print('res : ${res.body}');

    if (res.statusCode == 200){
      final exData = jsonDecode(res.body);
      print(exData['dataPayload']['data']['token']);

      GlobalString.token = exData['dataPayload']['data']['token'];
      GlobalString.username = exData['dataPayload']['data']['username'];

      snack_bar.showSnackBar(context, "Login is success");
      Navigator.pop(context,true);
    }

    else{
      final exData = jsonDecode(res.body);

      snack_bar.showSnackBar(context, exData['errorPayload']['errors']['password']);
      Navigator.of(context, rootNavigator: true).pop();
    }

  }


}