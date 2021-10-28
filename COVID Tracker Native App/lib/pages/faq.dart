import 'package:flutter/material.dart';
import '../data/source.dart';

class FAQ extends StatelessWidget {
  List questions = Emitter.FAQ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202c3b),
        centerTitle: false,
        title: Text("FAQ's")
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              questions[index]['question'],
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text(
                  questions[index]['answer'],
                  textAlign: TextAlign.justify
                )
              )
            ]
          );
        }
      )
    );
  }
}