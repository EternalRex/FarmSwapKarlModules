import "package:farm_swap_karl/colors/colors.dart";
import 'package:farm_swap_karl/pages/admin_sign_page/widgets/sign_in_txt_field.dart';
import "package:farm_swap_karl/routes/routes.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInAdmin extends StatefulWidget {
  const SignInAdmin({super.key});

  @override
  State<SignInAdmin> createState() => _SignInAdminState();
}

class _SignInAdminState extends State<SignInAdmin> {
  /*VARIABLES THAT ARE USED IN THE SINGINTEXT FIELD WIDGET SINCE WE NEED A 
 DIFFERENT LABEL FOR THE TWO TXT FIELDS WE MAKE TWO WIDGETS WITH A TEXT THAT
 CONTAINS THE LABEL AND THEN PASS THIS TO THE LABEL PROPERTY OF OUR TEXT FIELD HERE */
  Widget emailLabel = const Text("Email");
  Widget passwordLabel = const Text("Password");
  TextInputType textType = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*THE SVG PICTURE THAT IS THE BACKGROUND OF THE PAGE */
          SvgPicture.asset(
            "assets/images/admin_signIn_pattern.svg",
            // ignore: deprecated_member_use
            colorBlendMode: BlendMode.screen,
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
          //VERTICALLY CENTERING EVERY ELEMENT OF THE SOON TO BE COLUMN
          Center(
            /*A COLUMN THAT WILL CONTAIN THE ELEMENTS VERTICALLY */
            child: Column(
              /*HORIZONTALLY CENTERING ALL THE ELEMENTS OF THE COLUMN */
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //THE FARMSWAP LOGO
                const Image(
                  image: AssetImage(
                    "assets/images/logo3.png",
                  ),
                ),
                /*FARMSWAP TITLE */
                Text(
                  "FarmSwap",
                  style: TextStyle(
                    color: farmSwapTitlegreen,
                    fontSize: 40,
                    fontFamily: GoogleFonts.viga().fontFamily,
                    decoration: TextDecoration.none,
                  ),
                ),
                /*FARM SWAP DESCRIPTION */
                Text(
                  "Modern Barter Solution",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                /*SIZED BOX THAT GIVES SPACE BETWEEN THE DESCRIPTION AND THE
              LOGIN TITLE */
                const SizedBox(
                  height: 30,
                ),
                /*LOG IN ACCOUNT TITLE */
                Text(
                  "Login To Your Account",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                  ),
                ),
                /*GIVES A 20 HEIGHT SPACE BETWEEN THE LOGIN TITLE AND THE EMAIL TEXT BOX */
                const SizedBox(
                  height: 20,
                ),
                /*CONTAINS TEXT FIELD SO THAT WE CAN MANIPULATE THE WIDTH OF THE EMAIL TEXT FIELD */
                SizedBox(
                  height: 57,
                  width: 325,
                  /*HAS A LABEL PROPERTY FOR EMAIL THAT WILL TAKE VALUE FROM THE WIDGET
                  VARIABLES I SET ABOVE, THAT LABEL PROPERTY IS SET FROM THE SING_IN_TEXT_FIELD CLASS*/
                  child: SignInTxtField(
                    textType: false,
                    label: emailLabel,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                /*CONTAINS TEXT FIELD SO THAT WE CAN MANIPULATE THE WIDTH OF THE PASSWORD TEXT FIELD */
                SizedBox(
                  height: 57,
                  width: 325,
                  /*HAS A LABEL PROPERTY FOR PASSWORD THAT WILL TAKE VALUE FROM THE WIDGET
                  VARIABLES I SET ABOVE, THAT LABEL PROPERTY IS SET FROM THE SING_IN_TEXT_FIELD CLASS*/
                  child: SignInTxtField(
                    textType: true,
                    label: passwordLabel,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                /*LABEL ON CHOOSING TO CONTINUE WITH FACEBOOK OR GOOGLE */
                Text(
                  "Or continue with",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                /*VERTICALLY CENTERING THE ROW THAT WILL CONTAIN THE CONTAINERS
                THAT WILL HOLD THE FACEBOOK AND GOOGLE ICON */
                Center(
                  /*A ROW THAT WILL HOLD THE CONTAINER OF FACEBOOK AND GOOGLE ICON,
                  WE USED A ROW BECUASE WE WANT TO CONTAIN THE CONTAINERS IN A HORIZONTAL MANNER */
                  child: Row(
                    /* HORIZONTALLY CENTERING THE CHILDREN OF THE ROW*/
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*CONTAINER THAT HOLDS THE FACEBOOK ICON BUTTON */
                      Container(
                        height: 57,
                        width: 152,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.facebook),
                          iconSize: 30,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      /*cCONTAINER THAT HOLDS THE GOOGLE ICON BUTTON */
                      Container(
                        height: 57,
                        width: 152,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.google),
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                /*TEXT  */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Your Password?",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: farmSwapTitlegreen,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RoutesManager.adminSignUp);
                      },
                      child: Text(
                        "Sign Up Now!",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: farmSwapTitlegreen,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 50,
                        width: 141,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, farmSwapTitlegreen],
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
                            onPressed: () {
                              /*PUSHES A ROUTENAME INTO THE ROUTEMANAGER.GENERATE ROUTE */
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.dashboard);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
