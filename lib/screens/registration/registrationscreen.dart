import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookish/screens/registration/signupform.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              SizedBox(height: 70.0),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: TyperAnimatedTextKit(
                    text: ['Bookish'],
                    textStyle:
                        TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),
                  ),
                ),
              ),
              SignUpForm(),
            ],
          ))
        ],
      ),
    );
  }
}
