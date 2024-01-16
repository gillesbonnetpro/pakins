import 'dart:async';

import 'package:flutter/material.dart';

class Knob extends StatefulWidget {
  const Knob({super.key});

  @override
  State<Knob> createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  late double val;

  @override
  void initState() {
    val = 0;
    /* Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        val += 0.5;
      });
      print('$val');
    }); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => setState(
        () {
          if (details.delta.dy < 0 && val < 6) {
            val += 0.25;
          } else if (details.delta.dy > 0 && val > 1) {
            val -= 0.25;
          }
          print('$val / ${details.delta.dy}');
        },
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: val,
            child: SizedBox.fromSize(
              size: const Size(100, 100),
              child: Stack(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: const Offset(0, -10),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.amber),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text('$val')
        ],
      ),
    );
  }
}
