import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventmanagement/communityScreens/cHome.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagement/communityScreens/cHome.dart';

//import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController cName = TextEditingController();
  TextEditingController eDate = TextEditingController();
  TextEditingController eDesc = TextEditingController();
  TextEditingController eName = TextEditingController();
  TextEditingController eTime = TextEditingController();
  TextEditingController eVenue = TextEditingController();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('createevent');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Text: 'Create event',
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                //'title': cName.text,
                'cName': eName.text,
                'eDate': eDate.text,
                'eTime': eTime.text,
                'eVenue': eVenue.text,
                'eName': eName.text,
                'eDesc': eDate.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => cHome()));
              });
            },
            child: Text(
              "save",
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: cName,
                  decoration: InputDecoration(
                    hintText: 'Community name',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: eName,
                  decoration: InputDecoration(
                    hintText: 'Event Name',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: eDate,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Date',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: eTime,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Time',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: eVenue,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Venue',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
