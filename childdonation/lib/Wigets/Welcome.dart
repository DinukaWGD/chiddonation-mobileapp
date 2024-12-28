import 'package:childdonation/Screens/Home.dart';
import 'package:childdonation/Services/Authentication.dart';
import 'package:childdonation/Wigets/BottomNavBar.dart';
import 'package:childdonation/Wigets/Functionbtn.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("welcome"),
            Funcbtn(
              name: "Logout",
              onTab: () async {
                await AuthServices().signout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MynavBar()),
                    (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
