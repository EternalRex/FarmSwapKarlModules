import 'package:cloud_firestore/cloud_firestore.dart';
import 'update_querry_function.dart';

class UpdateAdminDateFields {
//class objects
  UpdateFirstNameRetriveDocId update = UpdateFirstNameRetriveDocId();

  Future<void> adminDateFields(
      String? value, DateTime newDate, String userid) async {
    switch (value) {
      case "birthdate":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"Birth Date": newDate};
        await documentref.update(updateFiled);
        break;

      case "registerdate":
        await update.getUpdateDocId(userid);
        final documentref =
            FirebaseFirestore.instance.collection('Users').doc(update.mydocid);
        final updateFiled = {"Registration Date": newDate};
        await documentref.update(updateFiled);
        break;
    }
  }
}
