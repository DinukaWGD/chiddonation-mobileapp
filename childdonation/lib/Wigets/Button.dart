import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String name;
  final Color btncolor;
  const Mybutton({super.key, required this.name, required this.btncolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: btncolor),
      child: Text(
        name,
        style: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
