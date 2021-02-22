import 'package:bookish/screens/home.dart';
import 'package:bookish/screens/login/loginscreen.dart';
import 'package:bookish/screens/noGroup/noGroup.dart';
import 'package:bookish/screens/splash_screen/splash_screen.dart';
import 'package:bookish/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  unknown,
  notInGroup,
  inGroup,
  notLoggedIn,
}

class Root extends StatefulWidget {
  static String id = 'root';
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartup();
    if (_returnString == "success") {
      if (_currentUser.getCurrentUser.groupId != null) {
        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      } else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
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
      case AuthStatus.notInGroup:
        retVal = NoGroup();
        break;
      case AuthStatus.inGroup:
        retVal = HomeScreen();
        break;
      case AuthStatus.unknown:
        retVal = SplashScreen();
        break;
      default:
    }
    return retVal;
  }
}
