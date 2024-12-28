import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseGoogle {
  final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> SignInGoogle() async {
    try {
      final GoogleSignInAccount? googlesigninAccount =
          await googleSignIn.signIn();
      if (googlesigninAccount != null) {
        final GoogleSignInAuthentication googleauth =
            await googlesigninAccount.authentication;
        final OAuthCredential authcredential = GoogleAuthProvider.credential(
            accessToken: googleauth.accessToken, idToken: googleauth.idToken);

        await auth.signInWithCredential(authcredential);
      } else {
        return;
      }
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      // "error sign in with google:${mapFirebaseAuthExceptionCodes(errorCode: error.code)}");
      //throw Exception(mapFirebaseAuthExceptionCodes(errorCode: error.code));
    } catch (e) {
      print('error sign in with google $e');
    }
  }
}
