import 'package:flutter/material.dart';

class loggedinWidget extends StatefulWidget {
  const loggedinWidget({ Key? key }) : super(key: key);

  @override
  _loggedinWidgetState createState() => _loggedinWidgetState();
}

class _loggedinWidgetState extends State<loggedinWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('you are logged in'),),
      body: Container(
        color: Colors.yellow,
      ),
      
    );
  }
}