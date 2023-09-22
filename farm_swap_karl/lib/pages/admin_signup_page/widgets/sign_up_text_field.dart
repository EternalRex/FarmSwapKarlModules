import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SignUpTxtField extends StatelessWidget {
  const SignUpTxtField(
      {super.key,
      required this.label,
      required this.textType,
      required this.signupController});

  final Widget label;
  final bool textType;
  final TextEditingController signupController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: signupController,
      obscureText: textType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: label,
        labelStyle: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
      ),
    );
  }
}
