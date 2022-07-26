import 'package:flutter/material.dart';
import 'package:eventmanagement/studentScreens/sLogin.dart';
import 'package:eventmanagement/WelcomeScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "WELCOME TO",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 37,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "College Event Management System",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Image(
                  image: AssetImage("images/logo.png"),
                  height: 250,
                  width: 250,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: ElevatedButton(
                  child: Text("Get Started"),
                  // minWidth: double.infinity,
                  // color: Colors.white,
                  // elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => sLogin()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
