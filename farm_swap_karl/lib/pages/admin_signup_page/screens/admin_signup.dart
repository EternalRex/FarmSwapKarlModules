/*import "package:farm_swap_karl/authentication/firebase_auth_services.dart";

import "package:farm_swap_karl/pages/admin_signup_page/controllers/admin_signUp_controllers.dart";
import "package:farm_swap_karl/pages/admin_signup_page/widgets/label_widgets/signup_labels.dart";
import 'package:farm_swap_karl/pages/admin_signup_page/widgets/sign_up_text_field.dart';
import "package:farm_swap_karl/routes/routes.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  /*A CONTROLLER CLASS THAT HOLDS EVERY CONTROLLER THAT WILL BE USED HERE THIS
  IS DONE SO THAT I WILL NOT HAVE TO DECLARE ALL THE TEXT CONTROLLERS IN THIS
  CLASS. I ONLY NEED ONE INSTANCE, THEN ACCESS EVERY CONTROLLER WITH THAT INSTANCE*/
  SignupControllers myController = SignupControllers();
  SignUpTextLabels myLabels = SignUpTextLabels();

  final bool isPassword = true;
  final bool isNotPassword = false;

  AdminFirebaseAuthentication signUpAthentication =
      AdminFirebaseAuthentication();

  //FirebaseAuthentication authenticateMe = FirebaseAuthentication();

  @override
  void dispose() {
    myController.emailController.dispose();
    myController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 100,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SignUpTxtField(
                  label: myLabels.emailLabel,
                  textType: isNotPassword,
                  signupController: myController.emailController,
                ),
                const SizedBox(
                  height: 40,
                ),
                SignUpTxtField(
                  label: myLabels.passwordLabel,
                  textType: isPassword,
                  signupController: myController.passwordController,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: signUp,
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//CREATING THE SIGN UP METHOD BY USING THE SIGN UP AUTHENTICATION METHOD WE USED IN THE FIREBASE AUTH
  void signUp() async {
    String email = myController.emailController.text;
    String password = myController.passwordController.text;

    User? user = await signUpAthentication.signUp(email, password);
    if (user != null) {
      print("User created successfully");
      Navigator.of(context).pushNamed(RoutesManager.dashboard);
    } else {
      print("User creation failed");
    }
  }
}


import 'dart:async';
import 'dart:html';

import 'package:farm_swap_karl/authentication/firebase_auth_services.dart';
import 'package:farm_swap_karl/pages/admin_sign_page/widgets/sign_in_txt_field.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/controllers/admin_signUp_controllers.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/data/sign_up_model.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/data/sign_up_saving.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/widgets/label_widgets/signup_labels.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/widgets/sign_up_text_field.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
/*CREATING AN INSTANCE OF THE LABEL CLASS THAT I CREATED*/
  SignUpTextLabels signUpLabels = SignUpTextLabels();

/*CREATING AN INSTANCE OF THE CONTROLLER CLASS THAT I CREATED SO THAT
I CAN ACCESS EVERY CONTROLLER IN THAT CONTROLLER CLASS*/
  SignupControllers signupControllers = SignupControllers();

/*INSTANTIATING FIREBASE AUTHENTICATION CLASS THAT I CREATED, IT CONTAINS
THE SIGN UP AND SIGN IN FUNCTIONS */
  AdminFirebaseAuthentication adminAuthentication =
      AdminFirebaseAuthentication();

  SignUpToDatabase databaseSave = SignUpToDatabase();

//Date Time Variables
  DateTime birthdate = DateTime.now();
  DateTime registerdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
/*Row for first naem and lastname */
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.firstNameLabel,
                        textType: false,
                        signupController: signupControllers.firstNameController,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.lastNameLabel,
                        textType: false,
                        signupController: signupControllers.lastNameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
/*Row for Email and Password */
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.emailLabel,
                        textType: false,
                        signupController: signupControllers.emailController,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.passwordLabel,
                        textType: false,
                        signupController: signupControllers.passwordController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
/*Row for Birth place and Birthdate */
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.birthplace,
                        textType: false,
                        signupController:
                            signupControllers.birthplaceController,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: ElevatedButton(
                        onPressed: () {
                          _selectDate();
                        },
                        child: const Text("Birth Date"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
/*Address and contact number */
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.address,
                        textType: false,
                        signupController: signupControllers.addressController,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.contact,
                        textType: false,
                        signupController:
                            signupControllers.contactnumController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
/*User role and registratino date */
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: SignUpTxtField(
                        label: signUpLabels.userRole,
                        textType: false,
                        signupController: signupControllers.userRole,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: ElevatedButton(
                        onPressed: () {
                          _selectDate();
                        },
                        child: const Text("Register Date"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
/*ID Picture Url amd Profile Picture Url */
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: IconButton(
                        onPressed: () {
                          uploadImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: IconButton(
                        onPressed: () {
                          uploadImage2();
                        },
                        icon: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
/*Register butoon */
                ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*Function that  */
  void register() async {
    /*PASSING THE TEXT VALUES OF THE TEXT BOXES INTO THE PARAMETER VARIABLES */
    String fname = signupControllers.firstNameController.text;
    String lastname = signupControllers.lastNameController.text;
    String email = signupControllers.emailController.text;
    String password = signupControllers.passwordController.text;
    String userid = FirebaseAuth.instance.currentUser!.uid;
    String address = signupControllers.addressController.text;
    String birthplace = signupControllers.birthplaceController.text;
    String contact = signupControllers.contactnumController.text;
    String userole = signupControllers.useridController.text;
    String idUrl = signupControllers.idUrl.text;
    String profileurl = signupControllers.profileUrl.text;

    User? user = await adminAuthentication.signUp(email, password);
    if (user != null) {
      Navigator.of(context).pushNamed(RoutesManager.dashboard);
    }

    final addAdmin = SignUpModel(
      userid: userid,
      firstname: fname,
      lastname: lastname,
      email: email,
      password: password,
      address: address,
      birthdate: birthdate,
      birthplace: birthplace,
      contactnum: contact,
      userRole: userole,
      registrationDate: registerdate,
      profileUrl: profileurl,
      idUrl: idUrl,
    );

    await databaseSave.createUser(addAdmin);
  }

/*Function yo pick an image for the id */
  Future<void> uploadImage() async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    setState(() {
      signupControllers.idUrl.text = downloadUrl;
    });
  }

/*Function to get image for the profile photo */
  Future<void> uploadImage2() async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    setState(() {
      signupControllers.profileUrl.text = downloadUrl;
    });
  }

/*Date picker function for birthdate */
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != birthdate) {
      setState(() {
        birthdate = pickedDate;
      });
    }
  }

  /*Function to pick date for registrationdate */

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
}
*/*/*/

import "package:farm_swap_karl/authentication/firebase_auth_services.dart";
import "package:farm_swap_karl/pages/admin_signup_page/controllers/admin_signUp_controllers.dart";
import "package:farm_swap_karl/pages/admin_signup_page/widgets/label_widgets/signup_labels.dart";
import "package:farm_swap_karl/pages/admin_signup_page/widgets/sign_up_text_field.dart";
import "package:farm_swap_karl/routes/routes.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key});

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
//Object of the Controller clas
  SignupControllers myControllerr = SignupControllers();

//Object of the label class
  SignUpTextLabels myLabels = SignUpTextLabels();

//Object of the authentication clas
  AdminFirebaseAuthentication adminAuth = AdminFirebaseAuthentication();

  @override
  void dispose() {
    // TODO: implement dispose
    myControllerr.emailController.dispose();
    myControllerr.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Sign Up"),
      ),
      body: Center(
        child: SizedBox(
          height: 600,
          width: 600,
          child: Column(
            children: [
/*Sized box for the email */
              SizedBox(
                height: 50,
                width: 500,
                child: SignUpTxtField(
                  label: myLabels.emailLabel,
                  textType: false,
                  signupController: myControllerr.emailController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
/*Sized box for the pasword */
              SizedBox(
                height: 50,
                width: 500,
                child: SignUpTxtField(
                  label: myLabels.passwordLabel,
                  textType: true,
                  signupController: myControllerr.passwordController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  registerAdminAuth();
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Function for creating authentication
  Future<void> registerAdminAuth() async {
    String email = myControllerr.emailController.text;
    String password = myControllerr.passwordController.text;

    User? user = await adminAuth.signUp(email, password);
    if (user != null) {
      Navigator.of(context).pushNamed(RoutesManager.adminSignUp2);
    } else
      print("Errorr");
  }
}
