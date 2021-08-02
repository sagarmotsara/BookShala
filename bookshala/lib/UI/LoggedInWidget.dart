
import 'dart:io';

import 'package:bookshala/logic/uplaodfile.dart';
import 'package:bookshala/logic/viewpdfs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class loggedinWidget extends StatefulWidget {
  @override
  _loggedinWidgetState createState() => _loggedinWidgetState();
}

class _loggedinWidgetState extends State<loggedinWidget> {
 final textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
    
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 250,
                  child: MaterialButton(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 40.0,
                        width: 200.0,
                        child: Center(
                          child: Text(
                            'Upload file',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    onPressed: () async {
                      final path = await FlutterDocumentPicker.openDocument();
                      print(path);
                      File file = File(path);
                      firebase_storage.UploadTask task =
                          await uploadFile( context,file, textEditingController.text);
                    },
                  ),
                ),
              ),            
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                     TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                
                  hintText: 'file name',
                  labelText: 'Name *',
                ),
                
                validator: (String? value) {
                  if(value ==null){
                    print('you dont choose file name');
                     return null;
                  }
                },
                
                controller: textEditingController,
              ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
 onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => loadPdf()));
       },
               child: Text('view pdf')),
            ],
          ),
      ),
      
      
    );
  }
}
