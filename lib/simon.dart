import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pakins/pastille.dart';

class Simon extends StatefulWidget {
  Simon({super.key, required this.pointNb}) {
    assert(pointNb > 0 && pointNb < 11);
  }

  final int pointNb;

  @override
  State<Simon> createState() => _SimonState();
}

class _SimonState extends State<Simon> {
  late List<MaterialColor> colorList;
  late List<Pastille> pastList;

  @override
  void initState() {
    colorList = [
      Colors.blue,
      Colors.brown,
      Colors.yellow,
      Colors.deepOrange,
      Colors.pink,
      Colors.teal,
      Colors.purple,
      Colors.cyan,
      Colors.indigo,
      Colors.lightBlue,
    ];

    pastList = [];
    double pi2 = math.pi * 2;
    double portion = pi2 / widget.pointNb;
    double angle = 0;
    for (var i = 0; i < widget.pointNb; i++) {
      double cos = (math.cos(angle)) * 0.90;
      double sin = (math.sin(angle)) * 0.90;
      pastList.add(
        Pastille(
          color: colorList[i],
          posX: cos,
          posY: sin,
          sizeFactor: widget.pointNb,
          highLight: false,
        ),
      );
      angle += portion;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide * 0.75;

    return SizedBox(
      height: size,
      width: size,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(maxHeight: size),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 220, 220, 220)),
          child: Stack(
            children: pastList,
          ),
        ),
      ),
    );
  }
}
