import 'package:eventmanagement/studentScreens/RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagement/communityScreens/cLogin.dart';
import 'package:eventmanagement/studentScreens/sHome.dart';
import 'package:eventmanagement/RoundedButton.dart';
import 'package:eventmanagement/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:eventmanagement/WelcomeScreen.dart';

class sLogin extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _sLoginState createState() => _sLoginState();
}

class _sLoginState extends State<sLogin> {
  get firebase => null;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await firebase.initializeApp();
    return firebaseApp;
  }

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Student Login',
                colour: Color(0xfffe8378),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    if (newUser != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => sHome()));
                    } else {}

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(
                height: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        RegistrationScreen())));
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            )),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => cLogin())));
                          },
                          child: Text(
                            'Communitty login',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            )),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
