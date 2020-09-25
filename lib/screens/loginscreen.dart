import 'package:bookish/screens/registrationscreen.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:bookish/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a email';
                      }
                    },
                    onSaved: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                    validator: (value) {
                      if (value.length < 6) {
                        return 'Weak Password. Try Again';
                      }
                    },
                    onSaved: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(inUser: user)));
                          // } on FirebaseAuthException catch (e) {
                          //   if (e.code == 'wrong_password') {
                          //     return 'Wrong Password';
                          //   }
                          // }
                        } catch (e) {
                          print(e.toString());
                          return null;
                        }
                      }
                    },
                    color: Color(0xffffd1d4),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New User?'),
                      FlatButton(
                        child: Text('Register'),
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
