import 'package:bookish/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bookish',
              style: TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text('Get Started'),
              color: Color(0xffffd1d4),
            )
          ],
        ),
      ),
    );
  }
}
