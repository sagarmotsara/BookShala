
import 'package:flutter/material.dart';
import 'package:bookshala/auth/google_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LandingPageForm extends StatefulWidget {
  LandingPageForm({Key? key}) : super(key: key);

  @override
  _LandingPageFormState createState() => _LandingPageFormState();
}

class _LandingPageFormState extends State<LandingPageForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Text(
                  'BookShala',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
              Expanded(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/login.jpg'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('Hi there, welcome to Bookshala'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: null,
              child: Text(
                "Login Using Mobile ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Text('or'),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: ElevatedButton.icon(
              onPressed: () {
                final provider =
                 Provider.of<GoogleSignInProvider>(context, listen: false);

                 provider.googleLogin();
              },
              icon: FaIcon(FontAwesomeIcons.google),
              label: Text(
                "Login Using Google",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}