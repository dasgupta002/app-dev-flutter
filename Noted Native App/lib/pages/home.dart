import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './add.dart';
import './view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).collection('notes');

  List<Color> myColors = [
    Colors.yellow[200],
    Colors.red[200],
    Colors.green[200],
    Colors.deepPurple[200],
    Colors.purple[200],
    Colors.cyan[200],
    Colors.teal[200],
    Colors.tealAccent[200],
    Colors.pink[200],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddNote();
          }))
          .then((value) {
              setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white70
        ),
        backgroundColor: Colors.grey[700],
      ),
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 33.0,
            fontWeight: FontWeight.bold,
            color: Colors.white70
          )
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff070706)
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length == 0) {
              return Center(
                child: Text(
                  "You have no saved Notes !",
                  style: TextStyle(
                    color: Colors.white70
                  )
                )
              );
            }

            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                Random random = new Random();
                Color bg = myColors[random.nextInt(4)];
                Map data = snapshot.data.docs[index].data();
                DateTime time = data['created'].toDate();
                String formattedTime = DateFormat.yMMMd().add_jm().format(time);

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return ViewNote(data, formattedTime, snapshot.data.docs[index].reference);
                    }))
                    .then((value) {
                      setState(() {});
                    });
                  },
                  child: Card(
                    color: bg,
                    margin: EdgeInsets.all(11.0),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['title']}",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                            )
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black87
                              )
                            )
                          )
                        ]
                      )
                    )
                  )
                );
              }
            );
          } else {
            return Center(
              child: Text("Loading ...")
            );
          }
        }
      )
    );
  }
}