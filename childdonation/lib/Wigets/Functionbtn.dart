import 'package:flutter/material.dart';

class Funcbtn extends StatelessWidget {
  final String name;
  final VoidCallback onTab;
  const Funcbtn({super.key, required this.name, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
