import 'package:bookshala/UI/LoggedInWidget.dart';
import 'package:bookshala/UI/landingpageform.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);}

          else if(snapshot.hasData){
            return loggedinWidget();
          }

          else if(snapshot.hasError){
            return Center(child: Text('Something Went wrong'),);
          }

          else {
            return LandingPageForm();
          }

        }
      
      ),
    );
  }
}