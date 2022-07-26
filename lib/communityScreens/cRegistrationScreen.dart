import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventmanagement/communityScreens/main1.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagement/communityScreens/cHome.dart';
import 'package:eventmanagement/studentScreens/sHome.dart';
import 'package:eventmanagement/RoundedButton.dart';
import 'package:eventmanagement/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class cRegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _cRegistrationScreenState createState() => _cRegistrationScreenState();
}

class _cRegistrationScreenState extends State<cRegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _csign = FirebaseFirestore.instance;
  bool showSpinner = false;
  String? cname;
  //String? ktureg;
  //String? branch;
  String? cemail;
  String? cphno;
  String? cpassword;
  String? cdisc;

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
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  cname = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter communitty name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  cphno = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your phone number'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  cdisc = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter discription'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  cemail = value;
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
                  cpassword = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Color.fromARGB(255, 110, 153, 247),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: cemail!, password: cpassword!);

                    await _csign.collection('signupc').add({
                      'cName': cname,
                      'cPhno': cphno,
                      'cDisc': cdisc,
                    });

                    if (newUser != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
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
