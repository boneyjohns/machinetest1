import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machine_test1/screens/homescreen/homescreen.dart';

emaillogin({required String useremail, required String userpassword}) async {
  try {
    final User? firebaseuser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: useremail, password: userpassword))
        .user;
    if (firebaseuser != null) {
      Get.offAll(() => HomeScreen(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 1));
    } else {}
  } on FirebaseAuthException catch (e) {
    log('error $e');
  }
}
