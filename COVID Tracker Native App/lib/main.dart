import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import './pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light
      ),
      dark: ThemeData(
        brightness: Brightness.dark
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: 'Covid Tracker',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: Home() 
        );
      }
    );
  }
}