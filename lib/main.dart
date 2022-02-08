import 'package:crackerit_02/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'model/login_model.dart';
import 'access/global_value.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool hidePassword = true;
  bool isApiCallProcess = false;
  bool hasError = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final usernameField = TextFormField(
      controller: username,
      obscureText: false,
      style: style,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return GlobalString.usernameError;
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).accentColor,
          ),
          hintText: "Username",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(2.0))),
    );
    final passwordField = TextFormField(
      controller: password,
      obscureText: hidePassword,
      style: style,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return GlobalString.usernameError;
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).accentColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            color: Theme.of(context)
                .accentColor,
            icon: Icon(hidePassword
                ? Icons.visibility_off
                : Icons.visibility),
          ),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(2.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(2.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(globalFormKey.currentState!.validate()) {
            API.loginMethod(username.text, password.text,context);
          } else {
            snack_bar.showSnackBar(context, "no error");
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: globalFormKey,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/icm_logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                usernameField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
