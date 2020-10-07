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
      backgroundColor: Color(0xfffdeef1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: Text(
                    'Bookish',
                    style: TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              SignUpForm(),
            ],
          ))
        ],
      ),
    );
  }
}
