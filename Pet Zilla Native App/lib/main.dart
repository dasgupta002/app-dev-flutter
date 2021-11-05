import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/drawer.dart';
import './pages/dashboard.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetsZilla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.cookieTextTheme(Theme.of(context).textTheme)
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            appDrawer(),
            Dashboard()
          ]
        )        
      )
    );
  }
}