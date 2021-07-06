import 'package:bookshala/UI/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookShala App', 
      theme: ThemeData(
        accentColor: Colors.lightBlue,
        fontFamily: 'poppins',
        primarySwatch: Colors.lightGreen,
      ),
      home: splashScreen(),
       
    );}
}

