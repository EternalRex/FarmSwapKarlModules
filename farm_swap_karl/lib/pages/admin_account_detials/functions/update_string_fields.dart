import 'package:cloud_firestore/cloud_firestore.dart';
import 'update_querry_function.dart';

class AdminUpdateStringFieldsFunction {
//class objects
  UpdateFirstNameRetriveDocId update = UpdateFirstNameRetriveDocId();

  Future<void> adminStringFields(
      String? value, String? updatedata, String userid) async {
    switch (value) {
      case "firstname":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"First Name": updatedata};
        await documentref.update(updateFiled);
        break;

      case "lastname":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"Last Name": updatedata};
        await documentref.update(updateFiled);
        break;

      case "birthplace":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"Birth Place": updatedata};
        await documentref.update(updateFiled);
        break;

      case "addresses":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"Address": updatedata};
        await documentref.update(updateFiled);
        break;

      case "contactnumber":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"Contact Number": updatedata};
        await documentref.update(updateFiled);
        break;

      default:
        throw ("Failed Update");
    }
  }
}
