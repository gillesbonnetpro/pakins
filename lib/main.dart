import 'package:flutter/material.dart';
import 'package:pakins/bg_tile.dart';
import 'package:pakins/knob.dart';
import 'package:pakins/simon.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Row(
              children: [
                Knob(),
                Knob(),
                Knob(),
              ],
            ),
            Simon(
              pointNb: 9,
            )
          ],
        ),
      ),
    );
  }
}
