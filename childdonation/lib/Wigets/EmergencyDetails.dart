import 'package:childdonation/Wigets/Button.dart';
import 'package:childdonation/Wigets/Functionbtn.dart';
import 'package:childdonation/Wigets/TextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class EmergencyDonation extends StatefulWidget {
  const EmergencyDonation({super.key});

  @override
  State<EmergencyDonation> createState() => _EmergencyDonationState();
}

class _EmergencyDonationState extends State<EmergencyDonation> {
  final TextEditingController name = TextEditingController();
  final ImagePicker _imagepicker = ImagePicker();

  Future<void> pickeImage() async {
    _imagepicker.pickImage(source: ImageSource.gallery);
  }

  void clearForm() {
    name.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Chidren in Emergency Needs",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Child Details",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            clearForm();
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close))
                                    ],
                                  ),
                                  TextFeilds(
                                    feildnme: "name",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "Age",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "Home Town",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "Home Adress",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "purpose",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "BAnk account Details",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "Responibal people",
                                    texteditingcontroller: name,
                                  ),
                                  TextFeilds(
                                    feildnme: "Personal phone number",
                                    texteditingcontroller: name,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Upload an image",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        child: const Icon(
                                            Icons.camera_alt_rounded),
                                        onTap: () {
                                          pickeImage();
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Funcbtn(
                                    name: "submit",
                                    onTab: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: const Mybutton(
                  name: "Add",
                  btncolor: Colors.green,
                ),
              )
            ],
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.white,
          Colors.white,
          Colors.greenAccent,
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [Text("this")],
          ),
        ),
      ),
    );
  }
}
