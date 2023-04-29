import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:machine_test1/functions/addresume.dart';
import 'package:machine_test1/model/resumemodel.dart';

class Files {
  PlatformFile? pickedfile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result == null) {
      return;
    }
    pickedfile = result.files.first;
  }

  upload() async {
    final path = 'resume/${pickedfile!.name} ';
    final file = File(pickedfile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    final _uploadTask = ref.putFile(file);

    final snap =
        await _uploadTask.whenComplete(() => log(pickedfile!.name.toString()));

    final fileurl = await snap.ref.getDownloadURL();
    await addresume(
        resumemodel: Resumemodel(fileurl: fileurl, id: pickedfile!.name));
  }
}
