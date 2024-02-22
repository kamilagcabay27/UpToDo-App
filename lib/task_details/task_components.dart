import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskComponent extends StatelessWidget {
  final Text? title;
  final Text? subtitle;
  final Widget? firstIcon;
  final Widget? secondIcon;

  TaskComponent({
    super.key,
    required this.title,
    required this.firstIcon,
    required this.secondIcon,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, right: 22),
      child: ListTile(
        tileColor: Colors.black,
        leading: firstIcon,
        title: title,
        trailing: secondIcon /* Image.asset("lib/assets/taskEdit.png") */,
        contentPadding: const EdgeInsets.symmetric(horizontal: 9),
        subtitle: subtitle,
      ),
    );
  }
}
