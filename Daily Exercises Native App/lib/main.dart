import 'package:flutter/material.dart';
import 'constants/theme.dart';
import 'screens/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Meditation App', 
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor, 
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor)
      ), 
      home: Home()
    );
  }
}