import 'package:flutter/material.dart';
import 'package:pakins/bg_tile.dart';
import 'package:pakins/knob.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Knob(),
            Knob(),
            Knob(),
          ],
        ),
      ),
    );
  }
}
