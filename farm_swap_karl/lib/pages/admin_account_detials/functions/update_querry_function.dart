import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateFirstNameRetriveDocId {
  String mydocid = "";

/*ig tawag ani na method is mo dawat nig userid na value */
  Future<String> getUpdateDocId(String userid) async {
    String myuserid = userid;

    CollectionReference reference =
        FirebaseFirestore.instance.collection('Users');
/*Tan awn dayn niya asa nga firebase document ang naay userr id nga parehas
sa iyang gidawat na value */
    QuerySnapshot query =
        await reference.where('User Id', isEqualTo: myuserid).get();

/*Kung naa man gani, e pull out ang documentId ani niya e store sa variable
na mydocid, nya e return ang mydocid */
    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      mydocid = documentSnapshot.id;
    } else {
      throw ("Failed id retieval");
    }
    return mydocid;
  }
}
