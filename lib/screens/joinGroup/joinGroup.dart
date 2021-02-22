import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bookish/utilities/ourcontainer.dart';
import 'package:provider/provider.dart';
import 'package:bookish/states/currentuser.dart';
import 'package:bookish/services/database.dart';
import 'package:bookish/states/root.dart';

class JoinGroup extends StatefulWidget {
  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {

  void _joinGroup(BuildContext context, String groupId) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await OurDatabase().joinGroup(groupId, _currentUser.getCurrentUser.uid);
    if(_returnString == "success"){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Root(),), (route) => false);
    }
  }

  TextEditingController _groupidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BackButton(),
              )],
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Column(
                children: [TextFormField(
                  controller: _groupidController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group_add),
                    hintText: "Group ID",
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () => _joinGroup(context, _groupidController.text),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}