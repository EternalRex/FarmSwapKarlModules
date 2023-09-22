import 'package:farm_swap_karl/colors/colors.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_txt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminRecentActivitiesBtn extends StatefulWidget {
  const AdminRecentActivitiesBtn({super.key});

  @override
  State<AdminRecentActivitiesBtn> createState() =>
      _AdminRecentActivitiesBtnState();
}

class _AdminRecentActivitiesBtnState extends State<AdminRecentActivitiesBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, buttonOrange],
          begin: Alignment.center,
          end: Alignment.center,
          stops: const [0.12, 0.25],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: DashBoardTxt(
            myText: "Activities",
            myColor: Colors.white,
            mySize: 15,
            myFont: GoogleFonts.poppins().fontFamily,
            myWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
