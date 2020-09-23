import 'package:bookish/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
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
            RaisedButton(
              onPressed: () async {
                dynamic result = await _auth.signInAnonymously();
                if (result == null) {
                  print('Error Signing In');
                } else {
                  print('Signed In');
                  print(result.uid);
                }
              },
              child: Text('Guest Login'),
              color: Color(0xffffd1d4),
            )
          ],
        ),
      ),
    );
  }
}
