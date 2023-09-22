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
*/

import 'package:farm_swap_karl/authentication/firebase_auth_services.dart';
import 'package:farm_swap_karl/pages/admin_sign_page/widgets/sign_in_txt_field.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/controllers/admin_signUp_controllers.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/data/sign_up_model.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/data/sign_up_saving.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/widgets/label_widgets/signup_labels.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/widgets/sign_up_text_field.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Container(
            width: 500,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                /*TEXT FIELD FOR FIRST NAME*/
                SignUpTxtField(
                  label: signUpLabels.firstNameLabel,
                  textType: false,
                  signupController: signupControllers.firstNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                /*TEXT FIELD FOR LAST NAME */
                SignUpTxtField(
                  label: signUpLabels.lastNameLabel,
                  textType: false,
                  signupController: signupControllers.lastNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                /*TEXT FIELD FOR EMAIL */
                SignUpTxtField(
                  label: signUpLabels.emailLabel,
                  textType: false,
                  signupController: signupControllers.emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                /*TEXT FIELD FOR PASSOWRD */
                SignUpTxtField(
                  label: signUpLabels.passwordLabel,
                  textType: true,
                  signupController: signupControllers.passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: Register,
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Register() async {
    /*PASSING THE TEXT VALUES OF THE TEXT BOXES INTO THE PARAMETER VARIABLES */
    String fname = signupControllers.firstNameController.text;
    String lastname = signupControllers.lastNameController.text;
    String email = signupControllers.emailController.text;
    String password = signupControllers.passwordController.text;

    User? user = await adminAuthentication.signUp(email, password);
    if (user != null) {
      Navigator.of(context).pushNamed(RoutesManager.dashboard);
    }
/*WE CREATED A USERREGISTER VARIABLE, AND WE PUT THE SIGNUPMOEL INSIE THAT VARIABLE, NOW 
THE SIGNUP MODEL HAS THE PROPERTIES THAT IS TO BE SAVED IN THE DATABASE. THEREFORE THE PROPERTY VALUES
TO BE SAVED IS NOW INSIDE THE USER REGISTER VARIABLE */
    final userRegister = SignUpModel(
      firstname: fname,
      lastname: lastname,
      email: email,
      password: password,
    );

/*USING THE INSTANCE OF THE CLASS OF SIGNUP MODEL WE ACCESS THE CREATE USER METHOD, SINCE
 THE CREATE USER METHOD REQUIRES A PARAMETER OF TYPE SIGNUP MODEL, WE PASS THE USERREGISTER VARIABLE
 BECAUSE THE SAID VARIABLE IS NOW A TYPE OF SIGNUPMODEL SINCE IT CONTAINS THE PROPERTIES OF THE SAID MODEL */
    databaseSave.createUser(userRegister);
  }
}
