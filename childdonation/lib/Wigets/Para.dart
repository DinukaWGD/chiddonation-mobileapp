import 'package:flutter/material.dart';

class Para extends StatelessWidget {
  final String text;
  final Color textCol;
  const Para({super.key, required this.text, required this.textCol});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: textCol, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
