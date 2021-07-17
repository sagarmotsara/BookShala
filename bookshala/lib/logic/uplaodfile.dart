import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:math';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<firebase_storage.UploadTask> uploadFile(
    BuildContext context, File file, String myname) async {
  if (file.path == null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('snack'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
    print('No file selected');
  }

  firebase_storage.UploadTask uploadTask;

  // Create a Reference to the file
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('playground')
      .child('/$myname.pdf');

  final metadata = firebase_storage.SettableMetadata(
      contentType: 'file/pdf', customMetadata: {'picked-file-path': file.path});
  print("Uploading..!");

  uploadTask = ref.putData(await file.readAsBytes(), metadata);

  print("done..!");
  return Future.value(uploadTask);
}
