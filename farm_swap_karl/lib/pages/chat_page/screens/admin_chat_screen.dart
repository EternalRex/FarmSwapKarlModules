import 'package:farm_swap_karl/pages/chat_page/model/admin_user_model.dart';
import 'package:farm_swap_karl/pages/chat_page/widgets/chat_user_item_widget.dart';
import 'package:farm_swap_karl/provider/chat%20provider/admin_chat_firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminChatPage extends StatefulWidget {
  const AdminChatPage({super.key});

  @override
  State<AdminChatPage> createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  @override
  void initState() {
    Provider.of<AdminChatProvider>(context, listen: false).getAllUser();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /* final userData = [
      ChatUserModel(
        uid: "1",
        name: "Kem",
        email: "kem@gmail.com",
        image:
            'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isOnline: true,
        lastactive: DateTime.now(),
      ),
      ChatUserModel(
        uid: "2",
        name: "Rollaine",
        email: "roll@gmail.com",
        image:
            'https://images.pexels.com/photos/341970/pexels-photo-341970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isOnline: true,
        lastactive: DateTime.now(),
      ),
      ChatUserModel(
        uid: "3",
        name: "Clare",
        email: "clare@gmail.com",
        image:
            'https://images.pexels.com/photos/730055/pexels-photo-730055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isOnline: false,
        lastactive: DateTime.now(),
      ),
      ChatUserModel(
        uid: "4",
        name: "Barriga",
        email: "rian@gmail.com",
        image:
            'https://images.pexels.com/photos/245388/pexels-photo-245388.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isOnline: false,
        lastactive: DateTime.now(),
      ),
    ];*/

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Consumer<AdminChatProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            physics: const BouncingScrollPhysics(),
            /*Since our userData is an array and that array has 4 ChatUserModels, then the
          item count is 4 */
            itemCount: value.user.length,
            itemBuilder: (context, index) {
              /*The index means the user array from position 0 - 3 */
              if (value.user[index].uid == FirebaseAuth.instance.currentUser?.uid) {
                return const SizedBox();
              } else {
                return ChatUserItem(user: value.user[index]);
              }
            },
          );
        },
      ),
    );
  }
}
