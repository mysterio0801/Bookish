import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Bookish',
          style: TextStyle(fontFamily: 'Sacramento', fontSize: 30.0),
        )),
        backgroundColor: Color(0xffffd1d4),
        elevation: 0.0,
        actions: [],
      ),
    );
  }
}
