import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test1/screens/homescreen/homescreen.dart';

void signinwithgoogle() async {
  GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleauth = await googleuser?.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // ignore: unnecessary_null_comparison
    if (userCredential != null) {
      Get.offAll(() => HomeScreen(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 1));
    }
  } on FirebaseAuthException catch (e) {
    log('error $e');
  }
}
