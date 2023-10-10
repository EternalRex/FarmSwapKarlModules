import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SignInTxtField extends StatelessWidget {
  const SignInTxtField(
      {super.key,
      required this.controller,
      required this.label,
      required this.textType});

  final Widget label;
  final bool textType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
