import 'package:flutter/material.dart';

class Pastille extends StatefulWidget {
  Pastille(
      {super.key,
      required this.color,
      required this.posX,
      required this.posY,
      required this.sizeFactor,
      required this.highLight});
  MaterialColor color;
  double posX;
  double posY;
  int sizeFactor;
  bool highLight;

  @override
  State<Pastille> createState() => _PastilleState();
}

class _PastilleState extends State<Pastille> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide / widget.sizeFactor;
    print('${widget.posX} / ${widget.posY}');

    return GestureDetector(
      onTapDown: (details) => setState(() {
        widget.highLight = true;
      }),
      onTapUp: (details) => setState(() {
        widget.highLight = false;
      }),
      child: Align(
        alignment: Alignment(widget.posX, widget.posY),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
            boxShadow: widget.highLight
                ? [
                    BoxShadow(
                        color: widget.color, spreadRadius: 1, blurRadius: 15)
                  ]
                : null,
          ),
        ),
      ),
    );
  }
}
