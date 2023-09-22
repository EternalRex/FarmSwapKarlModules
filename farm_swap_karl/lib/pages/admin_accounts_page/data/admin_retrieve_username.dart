import "package:cloud_firestore/cloud_firestore.dart";
import 'package:farm_swap_karl/pages/admin_accounts_page/data/admin_account_query.dart';
import "package:flutter/material.dart";

class GetUsername extends StatelessWidget {
  GetUsername({super.key, required this.documentId});

  final ReadAdminAccounts readAdminAccounts = ReadAdminAccounts();

  final String documentId;

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference adminUsers =
        FirebaseFirestore.instance.collection("Users");
    /*RETURNING A FUTURE BUILDER THAT HAS DOCUMENTSNAPSHOT PARAMETER*/    
    return FutureBuilder<DocumentSnapshot>(
      /*WE ARE WAITING FOR THE ADMINS USERS DOCUMENT ID THAT WE CAN GET FROM
      WHEREVER THIS CLASS IS CALLED */
      future: adminUsers.doc(documentId).get(),
      builder: (context, snapshot) {
        /*CHECK IF SNAPSHOTS ARE FULLY LOADED */
        if (snapshot.connectionState == ConnectionState.done) {
          /*IF IT IS FULLY LOADED THEN WE INITIALIZE A VARIABLE OF TYPE MAP AND ITS KEY
          VALUE PAIRS IS A STRING AND DYNAMIC */
          Map<String, dynamic> data =
          /*USING THE SNAPSHOT OBJECT WHICH WE GET FROM <DocumentSnapshot>  then we access
          the data which will contain the recent received data from the data function which contains all the 
          data from firebase*/
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              /*ACTUAL ACCESSING OF DATA */
              Text("First Name : ${data["First Name"]}"),
              Text("Last Name: ${data["Last Name"]}"),
            ],
          );
        }
        return const Text("Loading....");
      },
    );
  }
}
