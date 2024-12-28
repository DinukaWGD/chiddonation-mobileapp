import 'package:childdonation/Wigets/Snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fogetpassword extends StatefulWidget {
  const Fogetpassword({super.key});

  @override
  State<Fogetpassword> createState() => _FogetpasswordState();
}

class _FogetpasswordState extends State<Fogetpassword> {
  TextEditingController emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myDialogbox(context);
      },
      child: const Text(
          style: TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          "Foget Password"),
    );
  }

  void myDialogbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            // shape:
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Reset Password",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 18),
                        fillColor: const Color(0xFFedf0f8),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Enter the new email",
                        hintText: "e.g: abc@gmail.com"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        await auth
                            .sendPasswordResetEmail(email: emailcontroller.text)
                            .then((onValue) {
                          //if sucsess then show this messege
                          showSnackBar(context,
                              "we have send the email reset password to your email check it");
                        }).onError((error, StackTrace) {
                          //if unsucsess then showthe erroe message
                          showSnackBar(context, error.toString());
                        });

                        Navigator.pop(context);
                        emailcontroller.clear();
                      },
                      child: const Text(
                        "send",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
