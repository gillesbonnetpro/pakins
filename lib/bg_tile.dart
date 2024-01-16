import 'dart:async';

import 'package:flutter/material.dart';

class BgTile extends StatefulWidget {
  BgTile({super.key, required this.xPos, required this.imageHeight});

  double xPos;
  double imageHeight;

  @override
  State<BgTile> createState() => _BgTileState();
}

class _BgTileState extends State<BgTile> {
  late double Y;
  late double imageHeight;

  @override
  void initState() {
    imageHeight = widget.imageHeight;
    Y = widget.xPos;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      print('timer $Y');
      moveX();
    });
  }

  void moveX() {
    setState(() {
      Y++;
      if (Y > imageHeight) {
        Y = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, Y),
      child: Image(
        image: const AssetImage('assets/bgtile.jpg'),
        height: imageHeight,
        /*width: vWidth, */
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
