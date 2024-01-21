import 'package:flutter/material.dart';
import 'dart:math' as math;

class Simon extends StatefulWidget {
  Simon({super.key, required this.pointNb}) {
    assert(pointNb > 0 && pointNb < 11);
  }

  final int pointNb;

  @override
  State<Simon> createState() => _SimonState();
}

class _SimonState extends State<Simon> {
  late List<math.Point> coordList;

  @override
  void initState() {
    coordList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    coordList.clear();
    double size = MediaQuery.of(context).size.shortestSide * 0.75;
    double pi2 = math.pi * 2;
    double portion = pi2 / widget.pointNb;
    double angle = 0;
    for (var i = 0; i < widget.pointNb; i++) {
      double cos = (math.cos(angle)) * 0.90;
      double sin = (math.sin(angle)) * 0.90;
      coordList.add(math.Point(cos, sin));
      angle += portion;
    }

    print('$coordList');

    return SizedBox(
      height: size,
      width: size,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(maxHeight: size),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
          child: Stack(
            children: coordList.map((point) {
              return Align(
                  alignment: Alignment(point.x.toDouble(), point.y.toDouble()),
                  child: Text(coordList.indexOf(point).toString()));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
