import 'package:flutter/material.dart';
import '../../../../routes/routes.dart';
import '../../../admin_signup_page/widgets/sign_up_text_field.dart';
import '../../controllers/update_controller.dart';
import '../../others/admin_update_labels.dart';
import '../update_string_fields.dart';

class AdminAdressUpdate extends StatelessWidget {
  AdminAdressUpdate(
      {super.key, required this.optionValue, required this.userid});

//Class Objects
  AdminUpdateLabels myLabel = AdminUpdateLabels();
  AdminUpdateControllers myControllers = AdminUpdateControllers();
  AdminUpdateStringFieldsFunction stringupdate =
      AdminUpdateStringFieldsFunction();

//Variables
  String userid;
  String? optionValue;
  String updatedValue = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text("Address"),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Enter new address"),
              /*So para dili kalas og page, sa pop up na dialog box nalang ta mag enter sa 
                          details nga para update */
              content: SignUpTxtField(
                label: myLabel.fnameLabel,
                signupController: myControllers.fnameController,
                textType: false,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    /*Atong gikuha ang value sa atong text field nya ato gi store ani na variable */
                    updatedValue = myControllers.fnameController.text;
                    /*Ny atong gitawag diri sa onpressed ang method na updateString field, naa ni diras ubos
                                nya mo dawat og duha ka value, ang new data nga ato e update, og ang userid */
                    stringupdate.adminStringFields(
                        optionValue, updatedValue, userid);
                    Navigator.of(context)
                        .pushNamed(RoutesManager.displayadmindetails);
                  },
                  child: const Text("Update"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
