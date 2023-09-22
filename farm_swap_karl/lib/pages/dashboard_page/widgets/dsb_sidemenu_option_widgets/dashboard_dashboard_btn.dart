import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_txt.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardOptionsBtn extends StatelessWidget {
  const DashBoardOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/images/dashboard.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesManager.dashboard);
            },
            child: DashBoardTxt(
              myText: "Dashboard",
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
