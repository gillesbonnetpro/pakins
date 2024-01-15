import 'package:flutter/material.dart';

class BgTile extends StatefulWidget {
  const BgTile({super.key});

  @override
  State<BgTile> createState() => _BgTileState();
}

class _BgTileState extends State<BgTile> {
  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('assets/bgtile.jpg'));
  }
}
