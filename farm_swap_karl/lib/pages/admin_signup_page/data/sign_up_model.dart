class SignUpModel {
  //constructor
  SignUpModel({
    /*NO REQUIRED KEYWORD IS APPLIED SINCE ID IS NOT NECESSARILY REQUIRED */
    required this.userid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.address,
    required this.birthdate,
    required this.birthplace,
    required this.contactnum,
    required this.userRole,
    required this.registrationDate,
    required this.profileUrl,
    required this.idUrl,
  });

  //fields needed
  String firstname;
  String lastname;
  String? email;
  String password;
  String userid;
  String birthplace;
  DateTime birthdate;
  String address;
  String contactnum;
  String idUrl;
  String profileUrl;
  DateTime registrationDate;
  String userRole;

//CONVERTING THE PROPERTIES INTO JSON FORMAT TO SAVE TO DATABASE
  toJson() {
    return {
      "First Name": firstname,
      "Last Name": lastname,
      "Email": email,
      "Password": password,
      "User Id": userid,
      "Birth Place": birthplace,
      "Birth Date": birthdate,
      "Address": address,
      "Contact Number": contactnum,
      "ID Url": idUrl,
      "Profile Url": profileUrl,
      "Registration Date": registrationDate,
      "User Role": userRole,
    };
  }
}
