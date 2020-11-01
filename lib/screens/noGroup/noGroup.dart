import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  void createGroup() {}
  void joinGroup() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Spacer(flex: 1),
          Padding(padding: EdgeInsets.all(80.0),
          child: TyperAnimatedTextKit(text : ['Bookish'], textStyle: TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),),),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(onPressed:()=> createGroup(), child: Text('Create', style: TextStyle(color: Colors.white),),),
                RaisedButton(onPressed: ()=> joinGroup(), child: Text('Join', style: TextStyle(color: Colors.white),),),
            ],),
          ),
        ],
        ),
      ),
    );
  }
}
 