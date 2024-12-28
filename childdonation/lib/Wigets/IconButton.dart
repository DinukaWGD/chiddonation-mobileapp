import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final String imgname;
  const IconBtn({super.key, required this.imgname});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: AssetImage(imgname), fit: BoxFit.cover)),
    );
  }
}
