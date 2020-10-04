import 'package:bookish/widgets/OurContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.inUser});
  final UserCredential inUser;
  static String id = 'homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Bookish',
            style: TextStyle(fontFamily: 'Peddana', fontSize: 30.1),
          ),
        ),
        backgroundColor: Color(0xfff4acb7),
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
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
                    style: TextStyle(color: Colors.black, fontSize: 35.0),
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
                    child: Text("Finished"),
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
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
          )
        ],
      ),
    );
  }
}
