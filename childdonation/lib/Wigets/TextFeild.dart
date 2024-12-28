import 'package:flutter/material.dart';

class TextFeilds extends StatelessWidget {
  final String feildnme;
  final Icon? iconname;
  final TextEditingController texteditingcontroller;
  final bool ispass;

  const TextFeilds(
      {super.key,
      required this.feildnme,
      this.iconname,
      required this.texteditingcontroller,
      this.ispass = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: texteditingcontroller,
        obscureText: ispass,
        decoration: InputDecoration(
          hintText: feildnme,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 18),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          prefixIcon: iconname,
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xFFedf0f8),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.blue),
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
