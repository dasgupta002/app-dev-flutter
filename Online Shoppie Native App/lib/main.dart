import 'package:flutter/material.dart';
import './theme/constants.dart';
import './screens/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoppie UI',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor)
      ),
      home: Home()
    );
  }
}