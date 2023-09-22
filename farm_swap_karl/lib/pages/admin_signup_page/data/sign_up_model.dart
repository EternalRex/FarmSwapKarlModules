import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpModel {
  //constructor
  SignUpModel({
    /*NO REQUIRED KEYWORD IS APPLIED SINCE ID IS NOT NECESSARILY REQUIRED */
    this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  //fields needed
  String firstname;
  String lastname;
  String email;
  String password;
  /*THIS ID VARIABLE IS NOT NECESSARILLY REQUIRED IN THE CONSTRUCTER DUE TO THE ? SIGN */
  String? id;

//CONVERTING THE PROPERTIES INTO JSON FORMAT TO SAVE TO DATABASE
  toJson() {
    return {
      "First Name": firstname,
      "Last Name": lastname,
      "Email": email,
      "Password": password,
    };
  }
}
