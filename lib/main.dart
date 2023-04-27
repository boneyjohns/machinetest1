import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machine_test1/screens/Login_Page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Loginpage(),
    );
  }
}
