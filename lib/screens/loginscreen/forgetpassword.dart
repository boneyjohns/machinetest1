import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test1/const/const.dart';
import 'package:machine_test1/screens/loginscreen/checking_login.dart';
import 'package:machine_test1/widgets/my_text_field.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController forgotPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Forgot password",
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 250,
              child: Image.asset('lib/asset/forget-password-animation.gif'),
            ),
            kheight30,
            Text(
              "Enter the email associated with\nyour account and we'll send an\nemail with instructions to reset\nyour password",
            ),
            kheight30,
            Mytextformfield(
              preicon: Icons.email,
              text: 'Email',
              mycontroller: forgotPasswordController,
              hide: false,
            ),
            kheight30,
            GestureDetector(
              onTap: () async {
                var forgotEmail = forgotPasswordController.text.trim();
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: forgotEmail)
                      .then((value) {
                    log('Email send');
                    Get.off(() => const CheckingLogin());
                  });
                } on FirebaseAuthException catch (e) {
                  log('Error $e');
                }
              },
              child: Container(
                  height: 50,
                  width: 160,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      'Reset Passwod',
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
