import 'package:bookish/screens/login/loginform.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdeef1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              SizedBox(height: 80.0),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: Text(
                    'Bookish',
                    style: TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              LoginForm(),
            ],
          ))
        ],
      ),
    );
  }
}
