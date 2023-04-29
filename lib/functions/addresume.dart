import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:machine_test1/model/resumemodel.dart';

Future addresume({required Resumemodel resumemodel}) async {
  final add =
      FirebaseFirestore.instance.collection('resume').doc(resumemodel.id);
  final json = resumemodel.toJson();

  await add.set(json);
  log('added cate');
}
