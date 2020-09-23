import 'package:bookish/screens/authenticate.dart';
import 'package:bookish/screens/home.dart';
import 'package:bookish/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookish/models/user.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/2578594.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bookish',
                style: TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),
              ),
              RaisedButton(
                onPressed: () {
                  if (user == null) {
                    Navigator.pushNamed(context, Authenticate.id);
                  } else {
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                },
                child: Text('Get Started'),
                color: Color(0xffffd1d4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
