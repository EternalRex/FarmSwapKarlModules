import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/chat_page/model/admin_user_model.dart';
import 'package:flutter/material.dart';

class AdminChatProvider extends ChangeNotifier {
  /*Create a variable that will hold a list of usermodels */
  List<ChatUserModel> user = [];

  /*Method to get all users */
  List<ChatUserModel> getAllUser() {
    FirebaseFirestore.instance
        .collection("Users")
        .snapshots(includeMetadataChanges: true)
        .listen((user) {
      /*Maping the document and converting each document data into chatusermodel object */
      this.user = user.docs.map((doc) => ChatUserModel.fromJson(doc.data())).toList();
      notifyListeners();
    });
    return user;
  }
}
