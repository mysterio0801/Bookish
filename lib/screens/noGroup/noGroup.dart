import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookish/screens/createGroup/createGroup.dart';
import 'package:bookish/screens/joinGroup/joinGroup.dart';
import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void createGroup(BuildContext context) {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => CreateGroup(),
        ),
      );
    }
    void joinGroup(BuildContext context) {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => JoinGroup(),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Spacer(flex: 1),
          Padding(padding: EdgeInsets.all(80.0),
          child: TyperAnimatedTextKit(text : ['Bookish'], textStyle: TextStyle(fontFamily: 'Sacramento', fontSize: 50.0),),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('The perfect place for all the bookworms out there..!!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Since you are not in a club you can select either to join a club or create a club',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),),
          ),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(onPressed:()=> createGroup(context), child: Text('Create', style: TextStyle(color: Colors.white),),),
                RaisedButton(onPressed: ()=> joinGroup(context), child: Text('Join', style: TextStyle(color: Colors.white),),),
            ],),
          ),
        ],
        ),
      ),
    );
  }
}
 