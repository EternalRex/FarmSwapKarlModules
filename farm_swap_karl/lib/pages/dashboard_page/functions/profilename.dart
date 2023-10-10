import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/colors/colors.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('Users');
    print(documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;
          return Text("${data["First Name"]}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
