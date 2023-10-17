import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/chat_page/model/admin_user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatUserItem extends StatefulWidget {
  const ChatUserItem({super.key, required this.user});

  /*Create a variable of type ChatUserMode, this variable can be used to access
  properties and methods inside the chat user model class */
  final ChatUserModel user;

  @override
  State<ChatUserItem> createState() => _ChatUserItemState();
}

class _ChatUserItemState extends State<ChatUserItem> {
  @override
  Widget build(BuildContext context) {
    // String dateFormat = DateFormat("yyyy-MM-dd").format(widget.user.lastactive);
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 20),
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          /*The circular avatar that contains the image */
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.user.image),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CircleAvatar(
              radius: 5,
              /*Condition that states if user online is true it will display green color
              else it will display red color */
              backgroundColor: widget.user.isOnline ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
      /*The name the user */
      title: Text(
        widget.user.name,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
      /*The date when the user is last active */
      //  subtitle: Text("Last Active : $dateFormat "),
    );
  }
}
