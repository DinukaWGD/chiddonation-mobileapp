import 'package:childdonation/Screens/Home.dart';
import 'package:childdonation/Screens/Login.dart';
import 'package:childdonation/Services/Authentication.dart';
import 'package:childdonation/Wigets/Functionbtn.dart';
import 'package:childdonation/Wigets/Snackbar.dart';
import 'package:childdonation/Wigets/TextFeild.dart';
import 'package:childdonation/Wigets/Welcome.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController namecontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
  }

  void signupUSer() async {
    setState(() {
      isLoading = true; // Correct assignment
    });
    String res = await AuthServices().signupuser(
        email: emailcontroller.text,
        password: passwordcontroller.text,
        name: namecontroller.text);
    //if sign up is completed user is created and nevigate to the next page
    //othewiseshow th error messege

    if (res == "sucsess") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    } else {
      setState(() {
        isLoading = false;
      });
      //show the error meseg
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.white, Colors.greenAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Center(
                  child: Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: null,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/signin.jpg"))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFeilds(
                feildnme: "Enter your name",
                iconname: const Icon(
                  Icons.person,
                  color: Colors.black45,
                ),
                texteditingcontroller: namecontroller,
              ),
              TextFeilds(
                feildnme: "Enter your Email",
                iconname: const Icon(
                  Icons.email,
                  color: Colors.black45,
                ),
                texteditingcontroller: emailcontroller,
              ),
              TextFeilds(
                ispass: true,
                feildnme: "Enter your Password",
                iconname: const Icon(
                  Icons.lock,
                  color: Colors.black45,
                ),
                texteditingcontroller: passwordcontroller,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Funcbtn(
                name: "Signup",
                onTab: () {
                  signupUSer();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account??",
                    style: TextStyle(color: Colors.black45, fontSize: 17),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
