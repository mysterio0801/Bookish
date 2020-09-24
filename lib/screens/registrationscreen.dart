import 'package:flutter/material.dart';
import 'home.dart';
import 'package:bookish/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bookish',
              style: TextStyle(fontFamily: 'Sacramento', fontSize: 70.0),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email'),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password'),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      onPressed: () async {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        try {
                          if (newUser != null) {
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        } catch (e) {
                          print(e.toString());
                          return null;
                        }
                      },
                      color: Color(0xffffd1d4),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
