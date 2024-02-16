import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/index_screen/home_screen.dart';
import 'package:uptodo_app/task_details/task_components.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.5,
              ),
              IconButton(
                icon: Image.asset("lib/assets/repeatIcon.png"),
                onPressed: () {
                  // Sağ taraftaki yeni ikon için bir işlem yapabilirsiniz
                },
              ),
            ],
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            icon: Icon(Icons.close_rounded)),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
