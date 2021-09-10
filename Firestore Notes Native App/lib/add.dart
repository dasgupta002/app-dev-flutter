import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  final CollectionReference reference = FirebaseFirestore.instance.collection('native-notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                reference.add({
                  'title': title.text,
                  'body': content.text
                }).whenComplete(() {
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.save)
          )
        ]
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: TextField(
              controller: title,
              decoration: InputDecoration(hintText: 'Note title goes here!')
            )
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(30.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: TextField(
                controller: content,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Note body goes here!')
              )
            ),
          )
        ]
      )
    );
  }
}