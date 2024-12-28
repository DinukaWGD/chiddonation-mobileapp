import 'package:childdonation/Wigets/IconButton.dart';
import 'package:childdonation/Wigets/Para.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _currentIndex = 0;
  Timer? _timer;
  List<String> _backgroundImages = [
    "images/about1.jpg",
    "images/about2.jpg",
    "images/about3.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _startBackgroundChange();
  }

  void _startBackgroundChange() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _backgroundImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "About US",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          )),
          toolbarHeight: 80,
          flexibleSpace: ClipRRect(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage("images/background1.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.blueAccent.withOpacity(0.3),
                          BlendMode.srcATop))),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.white, Colors.greenAccent],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage(_backgroundImages[_currentIndex]))),
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.transparent),
                    child: const Column(
                      children: [
                        Para(
                          text:
                              "Welcome to Heart T0 Healp, a mobile app dedicated to transforming the lives of underprivileged children through the power of community and compassion.",
                          textCol: Colors.blue,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Para(
                          text:
                              "Our mission is to bridge the gap between those in need and those willing to help by providing a seamless platform for donations. With a focus on transparency and accountability, we ensure every contribution directly supports vital initiatives such as education, healthcare, and basic necessities for children living in poverty.",
                          textCol: Colors.blue,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Para(
                          text:
                              "Together, we can create a brighter future, one act of kindness at a time. Join us in making a meaningful difference today!",
                          textCol: Colors.blue,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Like Us On",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconBtn(
                                  imgname: "images/facebook.png",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconBtn(
                                  imgname: "images/whatsapp.png",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconBtn(
                                  imgname: "images/instagramm.png",
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
