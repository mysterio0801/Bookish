import 'dart:ui';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('loading...', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),),),      
    );
  }
}