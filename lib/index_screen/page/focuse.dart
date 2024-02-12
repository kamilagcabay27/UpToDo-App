import 'package:flutter/material.dart';

class Focuse extends StatefulWidget {
  const Focuse({super.key});

  @override
  State<Focuse> createState() => _FocuseState();
}

class _FocuseState extends State<Focuse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Focuse'),
      ),
      body: Center(
        child: Text('Focuse Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
