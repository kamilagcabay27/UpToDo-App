import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskComponent extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? firstIcon;
  final Widget? secondIcon;
  final double? fontSize;
  final double? buttonWidth;
  final double? buttonHeight;
  final HexColor? buttonColor;
  final String? buttonText;

  TaskComponent({
    super.key,
    required this.title,
    required this.firstIcon,
    this.secondIcon,
    this.subtitle,
    required this.fontSize,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonColor,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, right: 22),
      child: ListTile(
        tileColor: Colors.black,
        leading: firstIcon,
        title: Text(
          title!,
          style: GoogleFonts.lato(
              fontSize: fontSize!,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 9),
        trailing: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Expanded(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/kep.png"),
                  label: Text(
                    "$buttonText",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            )
            /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$buttonText",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (secondIcon != null) secondIcon!,
            ],
          ), */
            ),
        subtitle: Text(
          subtitle!,
          style: GoogleFonts.lato(
            color: HexColor("#AFAFAF"),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
