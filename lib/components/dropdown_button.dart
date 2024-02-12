import 'package:flutter/material.dart';

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key});

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String? choosenDay;
  List<String> allDay = [
    'Today',
    'Tomorrow',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      child: DropdownButton(
        items: allDay
            .map(
              (String day) => DropdownMenuItem(
                value: day,
                child: Text(day),
              ),
            )
            .toList(),
        value: choosenDay,
        onChanged: (String? value) {
          setState(() {
            print("Working : $value");
            choosenDay = value!;
          });
        },
      ),
    );
  }
}
