import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBox extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const SearchBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 350,
        height: 48,
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: Image.asset('lib/assets/search.png'),
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
              hintStyle: TextStyle(
                color: HexColor("#AFAFAF"),
              )),
        ),
      ),
    );
  }
}
