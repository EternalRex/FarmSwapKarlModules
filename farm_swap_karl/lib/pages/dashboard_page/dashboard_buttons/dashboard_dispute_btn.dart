import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboard_widgets.dart/widget_dashboard_txt.dart';

class DashDisputeOptionsBtn extends StatelessWidget {
  const DashDisputeOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/images/dispute.png",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: DashBoardTxt(
              myText: "Dispute",
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
