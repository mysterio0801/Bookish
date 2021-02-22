import 'package:bookish/screens/createGroup/createGroup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookish/models/user.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection('users').doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      DocumentSnapshot _docSnapShot =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapShot.data()["fullName"];
      retVal.fullName = _docSnapShot.data()["email"];
      retVal.accountCreated = _docSnapShot.data()["accountCreated"];
      retVal.groupId = _docSnapShot.data()["groupId"];
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> createGroup(String groupName, String userUid) async {
    String retVal = "error";
    List<String> members = List();

    try {
      members.add(userUid);
      DocumentReference _docRef = await _firestore.collection("groups").add({
        'name': groupName,
        'admin': userUid,
        'members': members,
        'groupCreate': Timestamp.now(),
      });

      await _firestore.collection("users").doc(userUid).update({
        'groupId': _docRef.id,
      }); 
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> joinGroup(String groupId, String userUid) async {
    String retVal = "error";
    List<String> members = List();
    try {
      members.add(userUid);
      await _firestore.collection("groups").doc(groupId).update({
        'members': FieldValue.arrayUnion(members), 
      });

      await _firestore.collection("users").doc(userUid).update({
        'groupId': groupId,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

}
