import 'package:flutter/material.dart';

class AdminDetailsProver with ChangeNotifier {
  /*I need a string property that will carry the value of the 
  userid whenever i click the uer id button */
  String adminuserid = "";

/*a getter of the setter method below to actuall call a setter in anothe class
i need to use thi getter + equal sign =>>>>>>> adminUserId = */
  String getadminUserId() {
    return adminuserid;
  }

  /*A setter to be called to set the value of the adminuser id variable
  whenever or wherever this setter method is called */
  void setadminUserId(String id) {
    /*i will now put a value to the adminuerid variable
    the value can be accessible in any class*/
    adminuserid = id;
    notifyListeners();
  }
}
