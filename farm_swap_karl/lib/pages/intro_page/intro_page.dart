import 'package:farm_swap_karl/colors/colors.dart';
import 'package:farm_swap_karl/routes/routes.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //USING STACK SINCE WE ARE GOING TO PUT AN ELEMENT ONE ON TOP OF THE OTHER
      body: Stack(
        children: [
          /*THE BACKGROUND IMAGE WHERE WIDTH AND HEIGHT ARE SET TO MATCH
          THE SCREEN SIZE*/
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              "assets/images/pattern2.svg",
              fit: BoxFit.fill,
            ),
          ),
          /*THIS IS THE LOGO OF FARMSWAP */
          Center(
            /*THIS COLUMN WILL CONTAIN THE LOGO, THE FARMSWAP NAME
            AND THE DESCRIPTION */
            child: Column(
              //CENTERING EVERY CHILD OF THIS COLUMN
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //THE LOGO PICTURE
                const Image(
                  image: AssetImage(
                    "assets/images/logo.png",
                  ),
                ),
                //THE FARMSWAP NAME
                Text(
                  "FarmSwap",
                  style: TextStyle(
                    color: farmSwapTitlegreen,
                    fontSize: 40,
                    fontFamily: GoogleFonts.viga().fontFamily,
                  ),
                ),
                //FARMSWAP DESCRIPTION
                Text(
                  "Modern Barter Solution",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // A BUTTON THAT WHEN CLICKED LEADS TO THE SIGN IN PAGE
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RoutesManager.signInPage);
                  },
                  //STYLING THE BACKGROUND OF THE BUTTON
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((state) {
                      if (state.contains(MaterialState.pressed)) {
                        return farmSwapTitlegreen;
                      } else {
                        return buttonOrange;
                      }
                    }),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
