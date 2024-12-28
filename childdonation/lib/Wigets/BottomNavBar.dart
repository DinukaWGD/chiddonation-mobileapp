import 'package:childdonation/Screens/About.dart';
import 'package:childdonation/Screens/Detail.dart';
import 'package:childdonation/Screens/Home.dart';
import 'package:childdonation/Screens/News.dart';
import 'package:flutter/material.dart';

class MynavBar extends StatefulWidget {
  const MynavBar({super.key});

  @override
  State<MynavBar> createState() => _MynavBarState();
}

class _MynavBarState extends State<MynavBar> {
  List screens = [const Home(), const About(), const Details(), const News()];
  int curenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: screens[curenIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    curenIndex = 0;
                  });
                },
                icon: Icon(
                    color: curenIndex == 0 ? Colors.blue : Colors.grey.shade400,
                    Icons.home)),
            IconButton(
                onPressed: () {
                  setState(() {
                    curenIndex = 1;
                  });
                },
                icon: Icon(
                    color: curenIndex == 1 ? Colors.blue : Colors.grey.shade400,
                    Icons.details)),
            IconButton(
                onPressed: () {
                  setState(() {
                    curenIndex = 2;
                  });
                },
                icon: Icon(
                    color: curenIndex == 2 ? Colors.blue : Colors.grey.shade400,
                    Icons.child_care)),
            IconButton(
                onPressed: () {
                  setState(() {
                    curenIndex = 3;
                  });
                },
                icon: Icon(
                    color: curenIndex == 3 ? Colors.blue : Colors.grey.shade400,
                    Icons.event)),
          ],
        ),
      ),
    );
  }
}
