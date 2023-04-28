import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machine_test1/screens/loginscreen/checking_login.dart';

signupfun(
    {required String username,
    required String userpassword,
    required String useremail,
    required String phone}) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: useremail,
    password: userpassword,
  );
  log('usercreated');

  Get.offAll(() => const CheckingLogin(),
      transition: Transition.circularReveal,
      duration: const Duration(seconds: 1));
}
