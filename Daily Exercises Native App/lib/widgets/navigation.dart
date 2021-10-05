import 'package:flutter/material.dart';
import './pills.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 11.0),
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      height: 88.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Pills(title: 'Today', path: 'assets/icons/calendar.svg', isActive: false, handler: () {}),
          Pills(title: 'All Exercises', path: 'assets/icons/gym.svg', isActive: true, handler: () {}),
          Pills(title: 'Settings', path: 'assets/icons/Settings.svg', isActive: false, handler: () {})
        ]
      )
    );
  }
}