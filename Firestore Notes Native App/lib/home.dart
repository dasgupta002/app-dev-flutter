import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add.dart';
import 'edit.dart';

class Home extends StatelessWidget {
  final reference = FirebaseFirestore.instance.collection('native-notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Native Notes App')),
      body: StreamBuilder<QuerySnapshot>(
          stream: reference.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditNote(document: snapshot.data!.docs[index]);
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      height: 150.0,
                      color: Colors.grey[200],
                      child: Column(children: <Widget>[
                        Text(data['title']),
                        Text(data['body'])
                      ]
                     )
                    )
                  );
                }
            );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNote();
          }));
        },
        child: Icon(Icons.add)
      ),
    );
  }
}