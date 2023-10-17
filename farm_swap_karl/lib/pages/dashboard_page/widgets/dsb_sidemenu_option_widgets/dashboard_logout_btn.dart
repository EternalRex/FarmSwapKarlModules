import 'package:farm_swap_karl/pages/admin_logs/database/admin_logs_insert_data.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_txt.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../functions/update_online_status.dart';

class DashLogoutOptionBtn extends StatelessWidget {
  DashLogoutOptionBtn({super.key});

  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();
  String? email = FirebaseAuth.instance.currentUser!.email;
  String? userid = FirebaseAuth.instance.currentUser!.uid;
  String activity = "user logout";
  DateTime date = DateTime.now();
  UpdateOnlineStatus onlineStatus = UpdateOnlineStatus();
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 40,
          ),
          const Image(
            image: AssetImage(
              "assets/images/logout.png",
            ),
          ),
          TextButton(
            onPressed: () {
              /*This will generate an admin log that will have the description as user logout */
              adminLogs.createAdminLogs(email, userid, activity, date);

              /*This will update the online status of the user as false so the user will be ofline in chats  */
              onlineStatus.updateOnlineStatus(FirebaseAuth.instance.currentUser!.uid, active);

              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(RoutesManager.introPage);
            },
            child: DashBoardTxt(
              myText: "Logout",
              myColor: Colors.black,
              mySize: 13,
              myFont: GoogleFonts.poppins().fontFamily,
              myWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
