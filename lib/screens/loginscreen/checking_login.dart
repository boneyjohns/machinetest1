// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test1/screens/homescreen/homescreen.dart';
import 'package:machine_test1/screens/loginscreen/signin_page.dart';

class CheckingLogin extends StatelessWidget {
  const CheckingLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return SingleChildScrollView(
                child: Signinpage(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error Occured"),
              );
            } else if (snapshot.data != null || snapshot.data!.uid != null) {
              return HomeScreen();
            } else {
              return SingleChildScrollView(
                child: Signinpage(),
              );
            }
          }),
    );
  }
}
