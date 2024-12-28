import 'package:carousel_slider/carousel_slider.dart';
import 'package:childdonation/Screens/About.dart';
import 'package:childdonation/Screens/Login.dart';
import 'package:childdonation/Screens/UpcommingEvnt.dart';
import 'package:childdonation/Wigets/Button.dart';
import 'package:childdonation/Wigets/DateTime.dart';
import 'package:childdonation/Wigets/EmergencyDetails.dart';
import 'package:childdonation/Wigets/Para.dart';
import 'package:childdonation/Wigets/ScrollImage.dart';
import 'package:childdonation/Wigets/VidioPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myimages = [
    const Scrollimg(
      myimg: "images/ima1.jpg",
      mywiget: UpcomminEvent(),
      name: "Nourishing Tomorrow",
      barval3: 30,
      barval2: 60,
    ),
    const Scrollimg(
      myimg: "images/ima2.jpg",
      mywiget: UpcomminEvent(),
      name: "Well-Being for All",
      barval3: 40,
      barval2: 70,
    ),
    const Scrollimg(
      myimg: "images/ima3.jpg",
      mywiget: UpcomminEvent(),
      name: "Pencils of Promise",
      barval3: 50,
      barval2: 50,
    ),
    const Scrollimg(
      myimg: "images/ima4.jpg",
      mywiget: UpcomminEvent(),
      name: "Covers of Kindness",
      barval3: 60,
      barval2: 80,
    )
  ];

  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          flexibleSpace: ClipRRect(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage("images/bacground2.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(0.3), BlendMode.srcATop))),
            ),
          ),
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Timehour().limeMethod(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Text(
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      "Heart2Help"),
                  // Image.asset(
                  // width: 60, height: 60, "images/homeappbar_logo.jpg")
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Mybutton(
                          name: "Get Start", btncolor: Colors.blue))
                ],
              )
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blueAccent,
            Colors.white,
            Colors.white,
            Colors.greenAccent,
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset("images/imge_home 1.jpg")),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Para(
                            textCol: Colors.green,
                            text:
                                "Every child deserves hope and a chance to grow.Your kindness can turn struggles into smiles, providing brighter futures.Together, we can make a big difference with small acts of giving."),
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Our Mission",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const VidioPlayer(
                        vidioURL:
                            'https://videos.pond5.com/helpers-give-donated-shoes-young-footage-077717319_main_xxl.mp4',
                      ),
                      const Para(
                        text:
                            "Empowering underprivileged children with education, nutrition, healthcare, and support to break the cycle of poverty, fostering hope, dignity, and opportunities for a brighter future.",
                        textCol: Colors.green,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: const Mybutton(
                          name: "Learn More",
                          btncolor: Colors.blue,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const About()));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Center(
                    child: Text(
                      "Upcomming Event",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CarouselSlider(
                      items: myimages,
                      options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayInterval: const Duration(seconds: 2),
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              curentIndex = index;
                            });
                          })),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: curentIndex,
                      count: myimages.length,
                      effect: WormEffect(
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                          spacing: 10.0,
                          dotColor: Colors.grey.shade300,
                          activeDotColor: Colors.grey.shade400),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text(
                          "Imediate Care",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const Para(
                            textCol: Colors.green,
                            text:
                                "Support urgent needs! Donate now to help children in crisis with food, shelter, education, and medical care. Every contribution matters."),
                        GestureDetector(
                          child: const Mybutton(
                            name: "Learn More",
                            btncolor: Colors.blue,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmergencyDonation()));
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: const Column(
                      children: [
                        Center(
                          child: Text(
                            "Donations So Far",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PrimerProgressBar(segments: [
                          Segment(
                              value: 20,
                              color: Colors.orange,
                              label: Text("Nourishing Tomorrow")),
                          Segment(
                              value: 40,
                              color: Colors.green,
                              label: Text("Covers of Kindness")),
                          Segment(
                              value: 60,
                              color: Colors.blue,
                              label: Text("Pencils of Promise")),
                          Segment(
                              value: 80,
                              color: Colors.grey,
                              label: Text("Well-Being for All")),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
