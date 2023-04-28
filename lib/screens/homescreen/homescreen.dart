import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test1/functions/select_file.dart';
import 'package:machine_test1/screens/loginscreen/checking_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Upload your cv "),
          centerTitle: true,
          actions: [
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
          // if (pickedfile != null)
          //   Expanded(
          //       child: Container(
          //     height: 200,
          //     width: 300,
          //     color: Colors.blue,
          //     child: Center(child: Text(pickedfile!.name)),
          //   )),,
          ElevatedButton(
              onPressed: () async {
                final upload = Files();
                await upload.selectFile();
                upload.upload();
              },
              child: const Text('Upload'))
        ]),
      ),
    );
  }
}
