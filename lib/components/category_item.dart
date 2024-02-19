import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.color,
  });

  final String? categoryName;
  final Widget? categoryIcon;
  final HexColor? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: color),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: categoryIcon!),
                ],
              ),
            ),
          ),
        ),
        Text(
          categoryName!,
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
