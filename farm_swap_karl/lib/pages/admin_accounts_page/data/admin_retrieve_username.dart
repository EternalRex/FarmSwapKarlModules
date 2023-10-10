import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_karl/pages/admin_account_detials/screen/admin_details.dart";
import 'package:farm_swap_karl/pages/admin_accounts_page/data/admin_account_query.dart';
import "package:farm_swap_karl/provider/admin%20details%20provider/admin_details_provider.dart";
import "package:farm_swap_karl/routes/routes.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class GetUsername extends StatefulWidget {
  GetUsername({
    super.key,
    this.documentId,
  });

  final String? documentId;
  String selectedId = "";

  @override
  State<GetUsername> createState() => _GetUsernameState();
}

class _GetUsernameState extends State<GetUsername> {
  final ReadAdminAccounts readAdminAccounts = ReadAdminAccounts();
  AdminDetails adminDetails = AdminDetails();

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference adminUsers =
        FirebaseFirestore.instance.collection("Users");

/*RETURNING A FUTURE BUILDER THAT HAS DOCUMENTSNAPSHOT PARAMETER*/
    return FutureBuilder<DocumentSnapshot>(
/*WE ARE WAITING FOR THE ADMINS USERS DOCUMENT ID THAT WE CAN GET FROM
WHEREVER THIS CLASS IS CALLED */
      future: adminUsers.doc(widget.documentId).get(),
      builder: (context, snapshot) {
/*CHECK IF SNAPSHOTS ARE FULLY LOADED */
        if (snapshot.connectionState == ConnectionState.done) {
          /*IF IT IS FULLY LOADED THEN WE INITIALIZE A VARIABLE OF TYPE MAP AND ITS KEY
  VALUE PAIRS IS A STRING AND DYNAMIC */
          Map<String, dynamic> data =
              /*USING THE SNAPSHOT OBJECT WHICH WE GET FROM <DocumentSnapshot>  then we access
  the data which wi  ll contain the recent received data from the data function which contains all the 
  data from firebase*/
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              /*ACTUAL ACCESSING OF DATA */
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        CachedNetworkImageProvider("${data["Profile Url"]}"),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text("${data["First Name"]}"),
                  const SizedBox(
                    width: 7,
                  ),
                  Text("${data["Last Name"]}"),
                  const SizedBox(
                    width: 7,
                  ),
/*Ang purpose ani na button  kay para ig click mo laho ni siya sa page kung asa e display ang
user account details, so kwaon nato diri ang user id sa user na gipili para maoy atong himoong
condition para ma pull out ang details a isa ka user*/
                  ElevatedButton(
                    onPressed: () {
/*So atong gi pasahag value ang selectedId na variable. nya ang value kay ang user id sa isa user */
                      setState(() {
                        widget.selectedId = "${data["User Id"]}";
                      });
/*So mogamit tag provider aron ang data nga naa sa solod sa selected id na variable ma access
og madala nato sa lain na class, so sa kani na part is ang value ni selected id atong gi asign
sa function nga setadmiUserId nga naa a clas nga AdminDetailsProver */
                      Provider.of<AdminDetailsProver>(context, listen: false)
                          .setadminUserId(widget.selectedId);
/*Nya og goods na ang everything mo adto na dayn tas next page */
                      Navigator.of(context)
                          .pushNamed(RoutesManager.displayadmindetails);
                    },
                    child: const Text("Details"),
                  ),
                ],
              ),
            ],
          );
        }
        return const Text("Loading....");
      },
    );
  }
}
