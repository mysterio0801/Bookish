import 'package:bookish/screens/login/loginscreen.dart';
import 'package:bookish/screens/registration/registrationscreen.dart';
import 'package:bookish/states/currentuser.dart';
import 'package:bookish/states/root.dart';
import 'package:bookish/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        theme: OurTheme().buildTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          Root.id: (context) => Root(),
        },
      ),
    );
  }
}
