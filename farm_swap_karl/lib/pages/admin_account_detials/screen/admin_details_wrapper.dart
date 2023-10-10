import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/controllers/update_controller.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/others/admin_update_labels.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/widgets/sign_up_text_field.dart';
import 'package:farm_swap_karl/provider/admin%20details%20provider/update_admin_dropdown_provider.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../functions/update_fname_function.dart';

class AdminDetailsWrapper extends StatefulWidget {
  AdminDetailsWrapper({super.key, required this.documentId});

/*So mao ni variable nga nidawat sa value nga gipasa gikan sa AdminDetail na clas */
  final String documentId;
  DateTime? _dateTime;

  @override
  State<AdminDetailsWrapper> createState() => _AdminDetailsWrapperState();
}

class _AdminDetailsWrapperState extends State<AdminDetailsWrapper> {
  @override
  Widget build(BuildContext context) {
//creates a reference to our database firestore
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");

    return FutureBuilder<DocumentSnapshot>(
/*So atong gigagmit ang value sa documentid na variable para hikapon tong document nga
naay document id nga similar sa value ni documentid */
      future: reference.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;

/*Since lain man kay kitaon ang date e display largo from firestore kay naka timestamp mani na format,
ato sang e convert into date time, so ato sa e solod ang birthdate sa timestamp variable */
          Timestamp datatimestamp = data["Birth Date"];
/*Then ato e convert si timestamp variable into date time */
          DateTime birthdate = datatimestamp.toDate();
/*Tapos ato siya gi format. Magamit ni siya na DateFormat na function after ma install ang
flutter pub add intl */
          String finalBirthdate = DateFormat('yyy-MM-dd').format(birthdate);

/*Converion for the registration date, process is similar above */
          Timestamp registerdateTM = data["Registration Date"];
          DateTime registerDate = registerdateTM.toDate();
          String finalRegistrationDate =
              DateFormat('yyyy-MM-dd').format(registerDate);

          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    CachedNetworkImageProvider("${data["Profile Url"]}"),
              ),
              Text("${data["User Id"]}"),
              const SizedBox(
                height: 7,
              ),
              const SizedBox(
                height: 7,
              ),
              Text("${data["First Name"]}"),
              const SizedBox(
                height: 7,
              ),
              Text("${data["Last Name"]}"),
              const SizedBox(
                height: 7,
              ),
              Text("${data["Birth Place"]}"),
              const SizedBox(
                height: 7,
              ),
              Text(finalBirthdate),
              const SizedBox(
                height: 7,
              ),
              Text("${data["Email"]}"),
              const SizedBox(
                height: 7,
              ),
              Text("${data["Address"]}"),
              const SizedBox(
                height: 7,
              ),
              Text("${data["Contact Number"]}"),
              const SizedBox(
                height: 7,
              ),
              Text(finalRegistrationDate),
              const SizedBox(
                height: 7,
              ),
              ElevatedButton(
                onPressed: () {
                  selectFieldToUpdate("${data["User Id"]}");
                },
                child: const Text("Update"),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  String? selectedValue;
  String? updatedValue;
  UpdateFirstNameRetriveDocId update = UpdateFirstNameRetriveDocId();
  AdminUpdateLabels mylabel = AdminUpdateLabels();
  AdminUpdateControllers myControllers = AdminUpdateControllers();

/*Thi is the method used to update the data it will accept a value from the 
elevated button above which is the user id of the uer */
  void selectFieldToUpdate(String passeduid) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose What to Update"),
          content: DropdownButton<String>(
            value: selectedValue,
/*A provider that mag carry onta sa text value sa hint pero morag na useless man
hahaha */
            hint: Consumer<UpdateAdminDropDownHint>(
              builder: (context, value, child) {
                return Text(value.getHint());
              },
            ),
            items: [
/*Item for first name */
              DropdownMenuItem(
                value: "firstname",
                child: GestureDetector(
                  child: Text("First Name"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter first name"),
/*So para dili kalas og page, sa pop up na dialog box nalang ta mag enter sa 
details nga para update */
                          content: SignUpTxtField(
                            label: mylabel.fnameLabel,
                            signupController: myControllers.fnameController,
                            textType: false,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
/*Atong gikuha ang value sa atong text field nya ato gi store ani na variable */
                                updatedValue =
                                    myControllers.fnameController.text;
/*Ny atong gitawag diri sa onpressed ang method na updateString field, naa ni diras ubos
nya mo dawat og duha ka value, ang new data nga ato e update, og ang userid */
                                updateStringField(updatedValue, passeduid);
                              },
                              child: const Text("Update"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
/*Item for last name */
              const DropdownMenuItem(
                value: "lastname",
                child: Text("Last Name"),
              ),
/*Item for email name */
              const DropdownMenuItem(
                value: "email",
                child: Text("Email"),
              ),
/*Item for birthdate name */
              const DropdownMenuItem(
                value: "birthdate",
                child: Text("Birthdate"),
              ),
/*Item for birth place */
              const DropdownMenuItem(
                value: "birthplace",
                child: Text("Birth Place"),
              ),
/*Item for address */
              const DropdownMenuItem(
                value: "addresses",
                child: Text("Addresses"),
              ),
/*Item for contact number */
              const DropdownMenuItem(
                value: "contactnum",
                child: Text("Contact Number"),
              ),
/*Item for registration date */
              const DropdownMenuItem(
                value: "regisrationdate",
                child: Text("Registration Date"),
              ),
            ],
            onChanged: (value) {
              selectedValue = value;
              Provider.of<UpdateAdminDropDownHint>(context, listen: false)
                  .setHint(value!);
              print("current value" + selectedValue.toString());
            },
          ),
        );
      },
    );
  }

/*So kani na method is para ni siya sa pag update sa mga fields nga of string value,
mo dawat nig 2 ka value, isa para sa newdata, ikaduha ang userid */
  Future<void> updateStringField(String? updatedata, String userid) async {
    /*Atong gi call ning getupdatedocid na function from the class of  UpdateFirstNameRetriveDocId, actually
 naka name ranig firstname pero pwde rani gamiton na class for all the string updates, tapos kaning
 iyang userid kay iya ning e process para ma pull out to ninyang documentid nga naa ani na userid*/
    await update.getUpdateDocId(userid);

    /*Tapo didto gihapon sa  UpdateFirstNameRetriveDocId na clas ang kanang function na atong bag e gi call
 mo return nag string value which is ang documentid nga iyang gi butang sa variable nga mydocid*/
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"First Name": updatedata};
    /*Ny after mag update na dayn ang everything */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }
}
