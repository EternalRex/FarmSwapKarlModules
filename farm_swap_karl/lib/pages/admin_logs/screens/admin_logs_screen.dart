import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverAllAdminLogsList extends StatelessWidget {
  OverAllAdminLogsList({super.key});

  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _db.collection('AdminLogs').orderBy('Activity Date').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text("Loading....");
        } else {
          final docs = snapshot.data!.docs;
          return Scaffold(
            body: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final document = docs[index];
                Timestamp dateTimestamp = document["Activity Date"];
                DateTime dateTime = dateTimestamp.toDate();
                String dateFinal =
                    DateFormat('yyyy-MM-DD HH:mm:ss').format(dateTime);
                return ListTile(
                  title: Text("${document["Admin Email"]} "
                      " $dateFinal "
                      " ${document["Admin Activity"]}"),
                );
              },
            ),
          );
        }
      },
    );
  }
}
