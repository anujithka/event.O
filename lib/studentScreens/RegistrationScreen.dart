import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagement/studentScreens/sHome.dart';
import 'package:eventmanagement/RoundedButton.dart';
import 'package:eventmanagement/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _sSignup = FirebaseFirestore.instance;
  bool showSpinner = false;
  String? sname;
  String? sktureg;
  String? sbranch;
  String? semail;
  String? sphno;
  String? spassword;

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
                  sname = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  semail = value;
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
                  spassword = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  sktureg = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'KTU login'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  sbranch = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your branch'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                obscureText: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  sphno = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your phone number'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Color(0xfffe8378),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: semail!, password: spassword!);

                    await _sSignup.collection('signupc').add({
                      'sname': sname,
                      'phn': sphno,
                      'ktulogin': sktureg,
                      'branch': sbranch,
                    });

                    if (newUser != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => sHome()));
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
