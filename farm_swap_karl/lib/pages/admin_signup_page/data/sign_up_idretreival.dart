import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetDocumentId {
  //Creating a string variable to put the user id that i get
  String docID = "";

  Future<String> getUserID() async {
//Accessing the userid of the auth and compare it to a field in our firestore
    String? userId = FirebaseAuth.instance.currentUser!.uid;

//Create a reference to the users collection in firestore
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");

//get the document of the Users collection whose User Id field has the value
//Equal to the userId variable
    QuerySnapshot query =
        await reference.where('User Id', isEqualTo: userId).get();

    print(userId);

    if (query.docs.isNotEmpty) {
      /*If the query is not empty access the first document that matches to the
      where condition then stire its document id to our doc id variable */
      DocumentSnapshot documentSnapshot = query.docs.first;
      docID = documentSnapshot.id;
      print(docID);
    } else {
      print("No document");
    }
    return docID;
  }
}
