import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget {
  const Myappbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
    );
  }
}
