import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 326,
        height: 48,
        child: TextField(
          style: GoogleFonts.lato(color: Colors.white),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade800),
              ),
              fillColor: Colors.black,
              filled: true,
              hintText: hintText,
              contentPadding: const EdgeInsets.only(left: 15),
              hintStyle: GoogleFonts.lato(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
