import 'package:animated_text_kit/animated_text_kit.dart';
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
      backgroundColor: Colors.pink[50],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              SizedBox(height: 100.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Center(
                  child: TyperAnimatedTextKit(
                    text: ['Bookish'],
                    textStyle:
                        TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),
                  ),
                ),
              ),
              LoginForm(),
            ],
          ))
        ],
      ),
    );
  }
}
