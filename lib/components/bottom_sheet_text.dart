import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomSheetTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  FocusNode _focusNode = FocusNode();

  BottomSheetTextField({
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
        width: 355,
        height: 43,
        child: TextFormField(
          focusNode: _focusNode,
          style: const TextStyle(color: Colors.white),
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
              fillColor: HexColor('#363636'),
              filled: true,
              hintText: hintText,
              contentPadding: const EdgeInsets.only(left: 15),
              hintStyle: TextStyle(
                color: Colors.grey[400],
              )),
        ),
      ),
    );
  }
}
