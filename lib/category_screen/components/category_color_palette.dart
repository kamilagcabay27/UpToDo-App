import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorPalette extends StatelessWidget {
  final HexColor? hexColor;
  const ColorPalette({super.key, this.hexColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: hexColor,
      ),
    );
  }
}
