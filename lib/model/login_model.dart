import 'dart:convert';

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
    String response = res.body;

    snack_bar.showSnackBar(context, response);
    Navigator.pop(context);

    if (res.statusCode == 200){ final exData = jsonDecode(res.body);

    print(exData);
    return res.body;
    } else{
      final exData = jsonDecode(res.body);

      print(exData);
      return res.statusCode;
    }

  }


}