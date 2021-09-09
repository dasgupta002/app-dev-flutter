import 'package:flutter/material.dart';
import './views/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Native News',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    home: Home()
  ));
}