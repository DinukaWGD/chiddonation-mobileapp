import 'package:childdonation/Screens/Home.dart';
import 'package:childdonation/Screens/Signup.dart';
import 'package:childdonation/Services/Authentication.dart';
import 'package:childdonation/Services/GoogleServices.dart';
import 'package:childdonation/Wigets/FogetPassword.dart';
import 'package:childdonation/Wigets/Functionbtn.dart';
import 'package:childdonation/Wigets/Snackbar.dart';
import 'package:childdonation/Wigets/TextFeild.dart';
import 'package:childdonation/Wigets/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //for controlllers
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void loginuser() async {
    setState(() {
      isLoading = true; // Correct assignment
    });
    String res = await AuthServices().loginuser(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
    //if login is sucsess nevigate to the next page
    //othewiseshow th error messege

    if (res == "sucsess") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Welcome()));
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
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.white, Colors.greenAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Center(
                  child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
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
                          image: AssetImage("images/login3.jpg"))),
                ),
              ),
              const SizedBox(
                height: 20,
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
              const Align(
                  alignment: Alignment.bottomRight, child: Fogetpassword()),
              const SizedBox(
                height: 20,
              ),
              Funcbtn(
                name: "Login",
                onTab: () {
                  loginuser();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(" or "),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () async {
                    await FirebaseGoogle.googleSignIn.signOut();
                    await FirebaseGoogle().SignInGoogle();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcome()),
                        (root) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(width: 25, height: 25, "images/google.jpg"),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            "Continue with Google")
                      ],
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Dont have an account??",
                    style: TextStyle(color: Colors.black45, fontSize: 17),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: const Text(
                      "Signup",
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
