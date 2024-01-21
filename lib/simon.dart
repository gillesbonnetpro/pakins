import 'package:flutter/material.dart';
import 'dart:math' as math;

class Simon extends StatefulWidget {
  const Simon({super.key, required this.pointNb});

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
    double size = MediaQuery.of(context).size.shortestSide;
    double pi2 = math.pi * 2;
    double portion = pi2 / widget.pointNb;
    double angle = 0;
    for (var i = 0; i < widget.pointNb; i++) {
      double cos = (math.cos(angle));
      double sin = (math.sin(angle));
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
          color: Colors.amber,
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
