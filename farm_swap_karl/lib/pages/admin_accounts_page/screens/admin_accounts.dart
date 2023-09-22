import 'dart:html';

import 'package:farm_swap_karl/pages/admin_accounts_page/data/admin_retrieve_username.dart';
import 'package:flutter/material.dart';

import '../data/admin_account_query.dart';

class AdminAccountsDisplay extends StatefulWidget {
  const AdminAccountsDisplay({super.key});

  @override
  State<AdminAccountsDisplay> createState() => _AdminAccountsDisplayState();
}

class _AdminAccountsDisplayState extends State<AdminAccountsDisplay> {
  ReadAdminAccounts readAccounts = ReadAdminAccounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //WE NEED A FUTURE BUILDER BECAUSE WE ARE HAVING AN ASYNC FUNCTION
        //WE ARE ALSO RETRIEVING AN FUTURE FUNCTION FROM READADMINACCOUNTS
        child: FutureBuilder(
          //WE SPECIFY HERE WHAT WE ARE ACTUALLY WAITING FOR IN THE FUTURE
          //AND THAT IS THE GETDOCUMENTSIDS
          future: readAccounts.getdocumentIds(),
          //WE ARE GETTING THE CONTEXT AND THE SNAPSHOTS
          builder: (context, snapshot) {
            //RETURING A LISTVIEW BUILDER
            return ListView.builder(
              //SPECIFYING THAT THE LIST WILL BE HOW MANY IS OUR DOCUMENTS IN FIREBASE
              itemCount: readAccounts.docId.length,
              //SO WE HAVE THE INDEX HERE WHICH ACCESS THE INDEX OF DOCS IN FIREBASE
              itemBuilder: (context, index) {
                return ListTile(
                  //SO WE DISPALY IN TEXT EVERY DOCUMENT ID IN FIREBASE
                  title: GetUsername(documentId: readAccounts.docId[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
