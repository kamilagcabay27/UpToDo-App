import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Items extends StatefulWidget {
  const Items(
      {super.key,
      required this.width,
      required this.height,
      required this.number});

  final double? width;
  final double? height;
  final int? number;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  // HexColor containerColor = HexColor("#363636");
  bool isItemPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            //containerColor = HexColor("#8697E7");
            isItemPressed = !isItemPressed;
          });
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isItemPressed ? HexColor("#8687E7") : HexColor("#363636"),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset("lib/assets/flag.png"),
                ),
                Text(
                  '${widget.number}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
