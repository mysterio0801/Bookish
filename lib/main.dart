import 'package:bookish/screens/loginscreen.dart';
import 'package:bookish/screens/registrationscreen.dart';
import 'package:flutter/material.dart';
import 'screens/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bookish/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
