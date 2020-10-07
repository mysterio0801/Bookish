import 'package:bookish/screens/home.dart';
import 'package:bookish/screens/login/loginscreen.dart';
import 'package:bookish/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class Root extends StatefulWidget {
  static String id = 'root';
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartup();

    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = LoginScreen();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}
