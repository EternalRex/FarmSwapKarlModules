import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/controllers/update_controller.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_querry_function.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_values/admin_address_update.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_values/admin_birthdate_update.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_values/admin_birthplace_update.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_values/admin_contactnum_update.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_values/admin_lastname_update.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/functions/update_values/admin_registerdate_update.dart';
import 'package:farm_swap_karl/pages/admin_account_detials/others/admin_update_labels.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../provider/admin details provider/update_admin_dropdown_provider.dart';
import '../../admin_signup_page/widgets/sign_up_text_field.dart';
import '../functions/update_values/admin_firstname_update.dart';

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
                  print("${data["User Id"]}");
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

  String? updatedValue;
  String? selectedValue;
/*First Method sa pag update where ang iyang components naa sa laing files/classes 
pero ang naka apan kay kinahanglan pa nmo siya e balik sa admin accounts page usa pa mo gana ang
update sa amin detailspage*/
  void selectFieldToUpdate(String userid) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose What to Update"),
          content: DropdownButton<String>(
            value: selectedValue,
            hint: Consumer<UpdateAdminDropDownHint>(
              builder: (context, value, child) {
                return Text(value.getHint());
              },
            ),
            items: [
/*first name */
              DropdownMenuItem(
                value: "firstname",
                child: AdminUpdateFirstName(
                    optionValue: "firstname", userid: userid),
              ),
/*last name */
              DropdownMenuItem(
                value: "lastname",
                child: AdminLastNameUpdate(
                    optionValue: "lastname", userid: userid),
              ),
/*birth place */
              DropdownMenuItem(
                value: "birthplace",
                child: AdminBirthPlaceUpdate(
                    optionValue: "birthplace", userid: userid),
              ),
/*address */
              DropdownMenuItem(
                value: "addresses",
                child:
                    AdminAdressUpdate(optionValue: "addresses", userid: userid),
              ),
/*contact number */
              DropdownMenuItem(
                value: "contactnumber",
                child: AdminContactNumUpdate(
                    optionValue: "contactnumber", userid: userid),
              ),
/*birthdate */
              DropdownMenuItem(
                value: "birthdate",
                child: AdminBirthDateUpdate(
                    optionValue: "birthdate", userid: userid),
              ),
/*registerdate */
              DropdownMenuItem(
                value: "registerdate",
                child: AdminRegisterDateUpdate(
                    optionValue: "registerdate", userid: userid),
              ),
            ],
            onChanged: (value) {
              selectedValue = value!;
              Provider.of<UpdateAdminDropDownHint>(context, listen: false)
                  .setHint(value);
            },
          ),
        );
      },
    );
  }

  //String? selectedValue;
  // String? updatedValue;
  UpdateFirstNameRetriveDocId update = UpdateFirstNameRetriveDocId();
  AdminUpdateLabels mylabel = AdminUpdateLabels();
  AdminUpdateControllers myControllers = AdminUpdateControllers();

/*Second method sa pag update, where ang iyang components naa ra diri na file, og kani gamiton, automatic ma update
ang details sa user dli na need mo balik sa user account na page*/

/*Thi is the method used to update the data it will accept a value from the 
elevated button above which is the user id of the uer */

  void selectFieldToUpdate2(String passeduid) {
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
                  child: const Text("First Name"),
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
                                updateFnameField(updatedValue, passeduid);
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
              DropdownMenuItem(
                value: "lastname",
                child: GestureDetector(
                  child: const Text("Last Name"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter last name"),
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
                                updateLastNameField(updatedValue, passeduid);
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
/*Item for birthdate name */
              DropdownMenuItem(
                value: "birthdate",
                child: GestureDetector(
                  child: const Text("Birthdate"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter Birthdate"),
                          /*So para dili kalas og page, sa pop up na dialog box nalang ta mag enter sa 
                        details nga para update */
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate(passeduid);
                                    },
                                    child: const Text("Select Date"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                /*Ny atong gitawag diri sa onpressed ang method na updateString field, naa ni diras ubos
                                nya mo dawat og duha ka value, ang new data nga ato e update, og ang userid */
                                updateBirthdate(registerdate, passeduid);
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
/*Item for birth place */
              DropdownMenuItem(
                value: "birthplace",
                child: GestureDetector(
                  child: const Text("Birth Place"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter Birth Place"),
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
                                updateBirthPlaceField(updatedValue, passeduid);
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
/*Item for address */
              DropdownMenuItem(
                value: "addresses",
                child: GestureDetector(
                  child: const Text("Addresses"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter Address"),
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
                                updateAddressField(updatedValue, passeduid);
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
/*Item for contact number */
              DropdownMenuItem(
                value: "contactnum",
                child: GestureDetector(
                  child: const Text("Contact Number"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter Contact Number"),
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
                                updateContactNumberField(
                                    updatedValue, passeduid);
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
/*Item for registration date */
              DropdownMenuItem(
                value: "regisrationdate",
                child: GestureDetector(
                  child: const Text("Registration Date"),
                  onTap: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Enter Birthdate"),
                          /*So para dili kalas og page, sa pop up na dialog box nalang ta mag enter sa 
                        details nga para update */
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate(passeduid);
                                    },
                                    child: const Text("Select Date"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                /*Ny atong gitawag diri sa onpressed ang method na updateString field, naa ni diras ubos
                                nya mo dawat og duha ka value, ang new data nga ato e update, og ang userid */
                                updateBirthdate(registerdate, passeduid);
                              },
                              child: const Text("Update"),
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
            onChanged: (value) {
              selectedValue = value;
              print(value);
              print(selectedValue);
              Provider.of<UpdateAdminDropDownHint>(context, listen: false)
                  .setHint(value!);
            },
          ),
        );
      },
    );
  }

//Variables for Date and Time
  DateTime registerdate = DateTime.now();
  DateTime birthdate = DateTime.now();

/*So kani na method is para ni siya sa pag update sa mga fields nga of string value,
mo dawat nig 2 ka value, isa para sa newdata, ikaduha ang userid */
  Future<void> updateFnameField(String? updatedata, String userid) async {
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

/*Function for uploading last name */
  Future<void> updateLastNameField(String? updatedata, String userid) async {
    await update.getUpdateDocId(userid);
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"Last Name": updatedata};
    await documentref.update(updateFiled);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }

/*Function for uploading birthplace */
  Future<void> updateBirthPlaceField(String? updatedata, String userid) async {
    await update.getUpdateDocId(userid);
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"Birth Place": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }

  /*Function for uploading address */
  Future<void> updateAddressField(String? updatedata, String userid) async {
    await update.getUpdateDocId(userid);
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"Address": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }

  /*Function for uploading contact number */
  Future<void> updateContactNumberField(
      String? updatedata, String userid) async {
    await update.getUpdateDocId(userid);
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"Contact Number": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }

/*Function for updating date name */
  Future<void> updateBirthdate(DateTime updatedata, String userid) async {
    await update.getUpdateDocId(userid);
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"Birth Date": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }

  /*Function for updating date name */
  Future<void> updateRegistrationDate(
      DateTime updatedata, String userid) async {
    await update.getUpdateDocId(userid);
    final documentref =
        FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
    final updateFiled = {"Registration Date": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.displayadmindetails);
  }

/*Function for selecting a date */
  Future<void> _selectDate(String userid) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: registerdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != registerdate) {
      setState(() {
        registerdate = pickedDate;
      });
    }
  }
}
