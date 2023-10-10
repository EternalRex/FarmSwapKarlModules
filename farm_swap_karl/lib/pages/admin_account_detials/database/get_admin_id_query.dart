import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/admin_accounts_page/data/admin_retrieve_username.dart';

class GetCurrentAdminID {
  //Create a varible that will hold the id that we get
  String? documentId;

  //Object of the GetUsername class
  GetUsername getuserid = GetUsername();

  //create an object of the firestore
  FirebaseFirestore database = FirebaseFirestore.instance;

  //Future method that will return a String]
  Future<String?> getAdminDetailsId(String data) async {
    String currentUserId = data;
    await database
        .collection("Users")
        .where("User Id", isEqualTo: currentUserId)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              documentId = element.reference.id;
            },
          ),
        );
    return documentId;
  }
}
