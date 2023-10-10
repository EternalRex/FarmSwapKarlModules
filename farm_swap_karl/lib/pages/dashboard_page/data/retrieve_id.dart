import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/dashboard_page/functions/profilephoto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardRetrieveSpecificID {
  //Create a variable to hold the pull outed id
  String docId = "";

  //Make an object that can access the firebase firestore
  FirebaseFirestore db = FirebaseFirestore.instance;

  //get the current users uid and store it in a variable
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<String> getDocsId() async {
    await db
        .collection('Users')
        .where('User Id', isEqualTo: userId)
        .get()
        .then((value) => value.docs.forEach((element) {
              docId = element.reference.id;
            }));
    print(docId);
    return docId;
  }
}
