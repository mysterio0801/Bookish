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
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
