import 'package:cloud_firestore/cloud_firestore.dart';

class OurGroup {
  String id;
  String name;
  String admin;
  List<String> members;
  Timestamp groupCreated;

  OurGroup({
    this.id,
    this.admin,
    this.name,
    this.members,
    this.groupCreated,
  });
}
