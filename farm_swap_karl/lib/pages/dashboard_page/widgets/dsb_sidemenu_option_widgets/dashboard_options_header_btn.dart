import 'package:farm_swap_karl/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashPageOptionsTitle extends StatefulWidget {
  const DashPageOptionsTitle({super.key});

  @override
  State<DashPageOptionsTitle> createState() => _DashPageOptionsTitleState();
}

class _DashPageOptionsTitleState extends State<DashPageOptionsTitle> {
  @override
  Widget build(BuildContext context) {
    /*A ROW THAT HOLDS THE LOGO , THE FARMSWAP TITLE AND THE DESCRIPTION */
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage("assets/images/logo3.png"),
          width: 55,
          height: 50,
        ),
        /*A COLUMN THAT IS PART OF THE ROW CHILDREN, HOLDS THE TITLE
          AND THE DESCRIPTION, THIS IS DONE SO THAT I CAN PUT THE DESCRIPTION
          UNDER THE TITLE BECAUSE IF I ONLY USE THE ROW, IT WILL DISPLAY THE 
          DESCRIPTION NEXT TO THE TITLE AND NOT BELOW IT */
        Column(
          children: [
            /*THE FARMSWAP TITLE */
            Text(
              "FarmSwap",
              style: TextStyle(
                fontSize: 20,
                color: farmSwapTitlegreen,
                fontFamily: GoogleFonts.viga().fontFamily,
              ),
            ),
            /*THE FARMSWAP DESCRIPTION */
            Text(
              "Modern Barter Solution",
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
