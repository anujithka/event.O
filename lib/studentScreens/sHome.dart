import 'package:flutter/material.dart';
import 'package:eventmanagement/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class sHome extends StatefulWidget {
  const sHome({Key? key}) : super(key: key);

  @override
  State<sHome> createState() => _sHomeState();
}

void getCurrentUser() {}

class _sHomeState extends State<sHome> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  void getCurrentuser() async {
    try {
      final user = _auth.currentUser!;
      loggedInUser = user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi!  akhil joy',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  const CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage('images/logo.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //
    );
  }
}
