import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class Scrollimg extends StatelessWidget {
  final String myimg;
  final Widget mywiget;
  final String name;
  final int barval3;
  final int barval2;

  const Scrollimg({
    super.key,
    required this.name,
    required this.myimg,
    required this.mywiget,
    required this.barval3,
    required this.barval2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(myimg))),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => mywiget));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: const Text(
              "Donate now",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          width: 200,
          height: 80,
          child: PrimerProgressBar(
              barStyle: const SegmentedBarStyle(
                  size: 3, backgroundColor: Colors.white38),
              legendStyle: const SegmentedBarLegendStyle(spacing: 0.1),
              segments: [
                Segment(
                    value: barval3,
                    color: Colors.blue,
                    label: const Text(
                        style: TextStyle(color: Colors.white),
                        "Expected Yearly Donation")),
                Segment(
                    value: barval2,
                    color: Colors.white,
                    label: const Text(
                        style: TextStyle(color: Colors.white),
                        "Yearly Targeted Donations")),
              ]),
        ),
      )
    ]);
  }
}
