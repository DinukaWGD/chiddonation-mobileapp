//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //for storing the data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

//for signup
  Future<String> signupuser(
      {required String email,
      required String password,
      required String name}) async {
    String res = "some error occur";
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        //for register user in firebase auth with email and password
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //for adding user to cloud firestore
        await _firestore.collection("users").doc(credential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid
          //cant store password in firestore data base
        });
        res = "sucsess";
      }
    } catch (e) {
      print(e.toString());
    }

    return res;
  }

  Future<String> loginuser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        //login user with email and password
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "sucsess";
      } else {
        res = "Plese enter all feilds";
      }
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  //for logout
  Future<void> signout() async {
    await _auth.signOut();
  }
}
//sign up part is done
