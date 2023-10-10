import "package:farm_swap_karl/pages/admin_account_detials/database/get_admin_id_query.dart";
import "package:farm_swap_karl/pages/admin_account_detials/screen/admin_details_wrapper.dart";
import "package:farm_swap_karl/provider/admin%20details%20provider/admin_details_provider.dart";
import "package:farm_swap_karl/routes/routes.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class AdminDetails extends StatelessWidget {
  AdminDetails({
    super.key,
  });
/*Aduna tay variable na user id nga String */
  String _userid = "";

/*Aduna tay obkect para maka access tas methods aning GetCurrentAdminId na classs */
  final GetCurrentAdminID adminid = GetCurrentAdminID();

  @override
  Widget build(BuildContext context) {
/*Diri atong e access ang value nga gi butang natos atong AdminDetail Prover na class nga naa sa
getadminUserId na method nya atong e  butang _userid na variable*/
    _userid = Provider.of<AdminDetailsProver>(context).getadminUserId();
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesManager.displayAccount);
                },
                child: const Icon(Icons.arrow_back))
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder(
/*So diri atong gi access ang getAdminDetailsId na method sa class nga  GetCurrentAdminID aron ma pull
out nato ang details sa user pinaagi sa user id na ato e provide diri-a nga naa a variable nga _userid */
          future: adminid.getAdminDetailsId(_userid),
          builder: (context, snapshot) {
/*So gi check nato kong nakakuha ba jud tag document id fromn the GetCurrentAdminID na clas */
            if (snapshot.hasData) {
/*Ug kung naa man gani document id nga nakuha atong e store a data na variable */
              String data = snapshot.data!;
/*Tapos ang document Id value nga naa sa data na variable atong e pasa sa Admin Details wrapper
aron didto e check unsa ni na doc unya pull outon pud didto na class ang mga data sa user under sa
document id na gi provide ni data variable */
              return AdminDetailsWrapper(documentId: data);
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
