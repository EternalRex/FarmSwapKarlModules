import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_txt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashTransactionsOptionsBtn extends StatelessWidget {
  const DashTransactionsOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/images/transactions.png",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: DashBoardTxt(
              myText: "Transactions",
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
