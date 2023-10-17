import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateOnlineStatusQuerry {
  String documentId = "";

  Future<String> getDocumentId(String userid) async {
    CollectionReference reference = FirebaseFirestore.instance.collection("Users");

    QuerySnapshot query = await reference.where('User Id', isEqualTo: userid).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      documentId = documentSnapshot.id;
    }
    return documentId;
  }
}
