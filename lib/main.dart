import 'package:bookish/models/user.dart';
import 'package:bookish/screens/loginscreen.dart';
import 'package:bookish/services/auth.dart';
import 'package:flutter/material.dart';
import 'screens/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bookish/screens/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:bookish/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          Authenticate.id: (context) => Authenticate(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        },
      ),
    );
  }
}
