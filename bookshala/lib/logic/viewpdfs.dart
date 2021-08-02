import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_pdfview/flutter_pdfview.dart';  
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:bookshala/UI/LoggedInWidget.dart';



class loadPdf extends StatefulWidget {
  const loadPdf({ Key? key }) : super(key: key);

  @override
  _loadPdfState createState() => _loadPdfState();
}

class _loadPdfState extends State<loadPdf> {
  String ?name;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  
  Future<void> listExample() async {  
  firebase_storage.ListResult result =  
  await firebase_storage.FirebaseStorage.instance.ref().child('playground').listAll();  
  
  result.items.forEach((firebase_storage.Reference ref) {  
    print('Found file: $ref');  
  });  
  
  result.prefixes.forEach((firebase_storage.Reference ref) {  
    print('Found directory: $ref');  
  });  
}
  Future<String> downloadURLExample() async {  
  String downloadURL = await firebase_storage.FirebaseStorage.instance  
  .ref('playground/some-file.pdf')
      .getDownloadURL();  
  print(downloadURL);  
  return downloadURL;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfPdfViewer.network('https://firebasestorage.googleapis.com/v0/b/bookshala-22c5a.appspot.com/o/playground%2Fsome-file.pdf?alt=media&token=170ab0bb-d65b-4eca-b312-ac872c05dcb8'),
      ),
    );
  }
}