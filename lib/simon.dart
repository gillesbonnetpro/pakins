import 'package:flutter/material.dart';

class Simon extends StatefulWidget {
  const Simon({super.key});

  @override
  State<Simon> createState() => _SimonState();
}

class _SimonState extends State<Simon> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide;

    return SizedBox(
      height: size,
      width: size,
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
