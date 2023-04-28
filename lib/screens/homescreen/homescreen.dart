import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test1/screens/loginscreen/checking_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              Get.off(() => const CheckingLogin(),
                  transition: Transition.circularReveal,
                  duration: const Duration(seconds: 1));
            },
            icon: const Icon(Icons.logout))
      ]),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () {}, child: const Text('pick file')),
          ElevatedButton(onPressed: () {}, child: const Text('Upload'))
        ]),
      ),
    );
  }
}
