import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ReadAdminAccounts {
//CREATE A LIST OF DOCUMENT ID'S
  List<String> docId = [];

//METHOD FOR GETTING DOCUMENT IDS
  Future getdocumentIds() async {
    /*POINTING TO THE COLLECTION CALLED USERS */
    /*GET THE SNAPSHOTS MEANING THE DOCUMENTS */
    /*FOR EACH LOOP THAT LOOPS THROUGH EVERY DOCUMENT AVAILABLE */
    await FirebaseFirestore.instance.collection("Users").get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              /*ADD THE IDS WE GET FROM THE LOOP TO OUR DOCID LIST VARIABLE */
              docId.add(document.reference.id);
            },
          ),
        );
  }
}
