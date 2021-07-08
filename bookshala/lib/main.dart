import 'package:bookshala/UI/splashscreen.dart';
import 'package:bookshala/auth/google_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
Future main() async {

 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) =>
     ChangeNotifierProvider(
       create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookShala App', 
        theme: ThemeData(
          accentColor: Colors.lightBlue,
          fontFamily: 'poppins',
          primarySwatch: Colors.lightGreen,
        ),
        home: splashScreen(),
         
      ),
    );
    }


