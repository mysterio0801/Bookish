import 'dart:ui';

import 'package:bookish/services/database.dart';
import 'package:bookish/states/currentuser.dart';
import 'package:bookish/states/root.dart';
import 'package:flutter/material.dart';
import 'package:bookish/utilities/ourcontainer.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  void _createGroup(BuildContext context, String groupName) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await OurDatabase().createGroup(groupName, _currentUser.getCurrentUser.uid);
    if(_returnString == "success"){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Root(),), (route) => false);
    }
  }

  TextEditingController _groupNameController = TextEditingController();
  
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
                  controller: _groupNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Name",
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () => _createGroup(context, _groupNameController.text),
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