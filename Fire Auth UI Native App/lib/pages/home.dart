import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/data.dart';

class Home extends StatelessWidget {
  final User? user;
  
  Home({ required this.user });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('TGD'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage((user?.photoURL).toString())
            )
          )
        ]
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
                radius: 40.0
              ),
              SizedBox(height: 20.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non tellus orci ac auctor augue. Leo vel orci porta non pulvinar neque laoreet suspendisse. Ullamcorper a lacus vestibulum sed arcu non odio. Turpis egestas pretium aenean pharetra magna ac placerat vestibulum. Sit amet nisl suscipit adipiscing bibendum. Mauris nunc congue nisi vitae suscipit tellus mauris. Vel pretium lectus quam id leo in vitae turpis massa. Vulputate dignissim suspendisse in est ante in nibh. Sollicitudin tempor id eu nisl nunc. Gravida neque convallis a cras semper. Risus feugiat in ante metus dictum. Lectus sit amet est placerat in egestas. Accumsan tortor posuere ac ut consequat semper viverra nam. Egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Ultricies lacus sed turpis tincidunt id aliquet risus feugiat in.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0
                )
              ),
            ]
          )
        )
      )
    );
  }
}