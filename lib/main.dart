import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagement/WelcomeScreen.dart';
import 'package:eventmanagement/studentScreens/sLogin.dart';
import 'package:eventmanagement/studentScreens/RegistrationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      // initialRoute: WelcomeScreen(),
      // routes: {
      //   WelcomeScreen.id: (context) => WelcomeScreen(),
      //   sLogin.id: (context) => sLogin(),
      //   RegistrationScreen.id: (context) => RegistrationScreen(),
      // },
    );
  }
}
