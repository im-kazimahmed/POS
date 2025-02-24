import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFieldWidget({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // labelText: hintText,
        labelStyle: GoogleFonts.poppins(
          color: backgroundColor,
          backgroundColor: primaryColor,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        fillColor: primaryColor,
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: backgroundColor,
        ),
      ),
      style: GoogleFonts.poppins(
        color: textHeadingColor,
      ),
      cursorColor: backgroundColor,
    );
  }
}
