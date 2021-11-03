import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import './edit.dart';
import './add.dart';

class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List contacts = []; 

  Future<void> _fetchStoreData() async {
    List data = [];

    print('Hello');

    http.Response response = await http.get(Uri.parse('http://bd66-116-206-222-51.ngrok.io/store/fetch'));
    data = jsonDecode(response.body);

    setState(() {
      contacts = data;
    });

    print('Hello');
  }
  
  Future<void> _deleteDataInStore(String id) async {
    await http.post(Uri.parse('http://bd66-116-206-222-51.ngrok.io/store/delete/$id'));

    _fetchStoreData();
  }

  @override
  void initState() {
    super.initState();

    _fetchStoreData();
  }

  @override
  Widget build(BuildContext context) {
    const colorSet = [ Colors.orange, Colors.green, Colors.blue, Colors.lime, Colors.cyan ];
    Random random = Random();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('MongoFlut'),
        centerTitle: false
      ),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (context, index) {
          return Divider(height: 2.0);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EditData(alias: contacts[index]["name"], dump: contacts[index]["mail"], id: contacts[index]["_id"]);
              })).then((_) => _fetchStoreData());
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorSet[random.nextInt(colorSet.length)],
                child: Text(contacts[index]["name"].substring(0, 1))
              ),
              title: Text(contacts[index]["name"]),
              subtitle: Text(contacts[index]["mail"]),
              trailing: IconButton(
                onPressed: ()  {
                  _deleteDataInStore(contacts[index]["_id"]);
                },
                icon: Icon(Icons.remove_circle)
              )
            )
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddData();
          })).then((_) => _fetchStoreData());
        },
        backgroundColor: Colors.brown,
        child: Icon(Icons.add)
      )
    );
  }
}