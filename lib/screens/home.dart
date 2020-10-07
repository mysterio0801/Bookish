import 'package:bookish/states/currentuser.dart';
import 'package:bookish/states/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookish/screens/noGroup/noGroup.dart';
import 'package:provider/provider.dart';
import 'package:bookish/utilities/ourcontainer.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void goToNoGroup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoGroup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Bookish',
            style: TextStyle(fontFamily: 'Peddana', fontSize: 30.1),
          ),
        ),
        backgroundColor: Color(0xfff4acb7),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Column(
                children: <Widget>[
                  Text(
                    "The God of Small Things",
                    style: TextStyle(color: Colors.black54, fontSize: 35.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Due In:",
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 30.0),
                        ),
                        Text(
                          " 22 days",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    child:
                        Text("Finished", style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Text(
                "Next Book Revealed in:",
                style: TextStyle(color: Colors.black54, fontSize: 33),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RaisedButton(
              child: Text("Details"),
              onPressed: () {
                goToNoGroup(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RaisedButton(
              child: Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                CurrentUser _currentUser =
                    Provider.of<CurrentUser>(context, listen: false);
                String _returnString = await _currentUser.signOut();
                if (_returnString == "success") {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Root.id, (route) => false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
