import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class Pdfviewer extends StatelessWidget {
  const Pdfviewer({super.key, required this.pdfpath});
  final String pdfpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(child: PdfView(path: pdfpath)),
              )
            ],
          ),
        ));
  }
}
