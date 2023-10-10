import "package:farm_swap_karl/pages/admin_signup_page/controllers/admin_signUp_controllers.dart";
import "package:farm_swap_karl/pages/admin_signup_page/data/sign_up_model.dart";
import "package:farm_swap_karl/pages/admin_signup_page/data/sign_up_saving.dart";
import "package:farm_swap_karl/pages/admin_signup_page/widgets/label_widgets/signup_labels.dart";
import "package:farm_swap_karl/pages/admin_signup_page/widgets/sign_up_text_field.dart";
import "package:farm_swap_karl/routes/routes.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../data/sign_up_idretreival.dart";

class AdminSignUp2 extends StatefulWidget {
  const AdminSignUp2({super.key});

  @override
  State<AdminSignUp2> createState() => _AdminSignUp2State();
}

class _AdminSignUp2State extends State<AdminSignUp2> {
//Object of the controller class
  SignupControllers myControllers = SignupControllers();

//Object of the sigup label class
  SignUpTextLabels myLabels = SignUpTextLabels();

//Object of the sign up querry class
  SignUpToDatabase addDataDB = SignUpToDatabase();

//Variables for Date and Time
  DateTime registerdate = DateTime.now();
  DateTime birthdate = DateTime.now();

  GetDocumentId test = GetDocumentId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register 2"),
      ),
      body: Center(
        child: SizedBox(
          height: 700,
          width: 700,
          child: Column(
            children: [
/*Row for first name and last name */
              Row(
                children: [
                  /*Text box for first name */
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.firstNameLabel,
                      textType: false,
                      signupController: myControllers.firstNameController,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  /*Sized box for last name */
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.lastNameLabel,
                      textType: false,
                      signupController: myControllers.lastNameController,
                    ),
                  )
                ],
              ),
/*Row for birthdate and register date */
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: IconButton(
                      onPressed: () {
                        _selectDate();
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: IconButton(
                      onPressed: () {
                        _selectDate2();
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  )
                ],
              ),
/*Row for birthplace and address */
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.birthplace,
                      textType: false,
                      signupController: myControllers.birthplaceController,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.address,
                      textType: false,
                      signupController: myControllers.addressController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
/*row for contact number and user role */
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.contact,
                      textType: false,
                      signupController: myControllers.contactnumController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.userRole,
                      textType: false,
                      signupController: myControllers.userRole,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
/*Password enter for checking purposes only */
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SignUpTxtField(
                      label: myLabels.passwordLabel,
                      textType: true,
                      signupController: myControllers.passwordController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
/*Register button*/
              ElevatedButton(
                onPressed: () {
                  insertDataDB();
                  Navigator.of(context).pushNamed(RoutesManager.adminsignup3);
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }

/*Function on how to select a date */
  Future<void> _selectDate() async {
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

  Future<void> _selectDate2() async {
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

/*Function to insert data into database */
  Future<void> insertDataDB() async {
    String firstname = myControllers.firstNameController.text;
    String lastname = myControllers.lastNameController.text;
    String? email = FirebaseAuth.instance.currentUser!.email;
    String password = myControllers.passwordController.text;
    String userid = FirebaseAuth.instance.currentUser!.uid;
    String address = myControllers.addressController.text;
    String contactnum = myControllers.contactnumController.text;
    String birthplace = myControllers.birthplaceController.text;
    String userrole = myControllers.userRole.text;
    DateTime birthday = birthdate;
    DateTime register = registerdate;

    final addData = SignUpModel(
      userid: userid,
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
      address: address,
      birthdate: birthday,
      birthplace: birthplace,
      contactnum: contactnum,
      userRole: userrole,
      registrationDate: register,
      profileUrl: "",
      idUrl: "",
    );

    await addDataDB.createUser(addData);
  }
}
