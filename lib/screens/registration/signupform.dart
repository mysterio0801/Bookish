import 'package:bookish/states/currentuser.dart';
import 'package:bookish/utilities/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullName);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: Text(
              "Register",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40.0),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              hintText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.alternate_email),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_open),
            ),
          ),
          SizedBox(height: 40.0),
          RaisedButton(
            onPressed: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(_emailController.text, _passwordController.text,
                    context, _fullNameController.text);
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Passwords do not match'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          FlatButton(
            child: Text("Existing User? Sign In"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
