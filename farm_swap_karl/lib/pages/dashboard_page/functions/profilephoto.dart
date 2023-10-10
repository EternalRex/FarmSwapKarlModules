import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_karl/pages/admin_signup_page/data/sign_up_idretreival.dart";
import "package:farm_swap_karl/pages/dashboard_page/data/retrieve_id.dart";
import "package:flutter/material.dart";

import "../../../colors/colors.dart";

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({
    super.key,
    required this.documentId,
  });

//Object of the get document id class
  final DashboardRetrieveSpecificID myId = DashboardRetrieveSpecificID();
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
          final image = CachedNetworkImageProvider("${data["Profile Url"]}");
          return Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: image,
              ),
              /*POSITIONING THE ADD PHOTO ICON INSIDE THE STACK */
              Positioned(
                width: 100,
                bottom: -10,
                left: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_a_photo),
                  color: farmSwapSmoothGreen,
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
