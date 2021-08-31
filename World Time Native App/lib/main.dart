import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/load.dart';
import 'pages/location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Load(),
      '/home': (context) => Home(),
      '/location': (context) => Location()
    }
  ));
}