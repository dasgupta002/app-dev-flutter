import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  final DocumentSnapshot document;
  EditNote({ required this.document });

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference reference = FirebaseFirestore.instance.collection('native-notes');

  @override
  void initState() {
    super.initState();

    Map<String, dynamic> data = widget.document.data() as Map<String, dynamic>;
    title = TextEditingController(text: data['title']);
    content = TextEditingController(text: data['body']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              widget.document.reference.update({
                'title': title.text,
                'body': content.text
              }).whenComplete(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.save)
          ),
          IconButton(
            onPressed: () {
              widget.document.reference.delete().whenComplete(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.delete)
          )
        ]
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: TextField(
              controller: title
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
              expands: true
             )
            ),
          )
        ]
      )
    );
  }
}