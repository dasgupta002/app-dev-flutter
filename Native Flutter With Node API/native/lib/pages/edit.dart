import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditData extends StatefulWidget {
  late String alias = '';
  late String dump = '';
  late String id = '';

  EditData({ required this.alias, required this.dump, required this.id });

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final TextEditingController nameHandler = TextEditingController();
  final TextEditingController mailHandler = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameHandler.text = widget.alias;
    mailHandler.text = widget.dump;
  }

  Future<void> _updateDataInStore() async {
    await http.post(Uri.parse('http://bd66-116-206-222-51.ngrok.io/store/edit/${widget.id}'), headers: <String, String> { "Content-Type": "application/json; charset=UTF-8" }, body: jsonEncode(<String, String> { "name": nameHandler.text , "mail": mailHandler.text }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Edit the Contact!',
              style: TextStyle(
                fontSize: 22.0
              )
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: nameHandler,
              decoration: InputDecoration(
                hintText: 'Full Name',
                border: OutlineInputBorder()
              )
            ),
            SizedBox(height: 6.0),
            TextField(
              controller: mailHandler,
              decoration: InputDecoration(
                hintText: 'Mailing Address',
                border: OutlineInputBorder()
              )
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateDataInStore();

          Navigator.of(context).pop();
        }, 
        child: Icon(Icons.save),
        backgroundColor: Colors.orange      
      )
    );
  }
}