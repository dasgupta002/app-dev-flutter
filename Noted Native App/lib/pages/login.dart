import 'package:flutter/material.dart';
import '../controller/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cover.png",
                    )
                  )
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 12.0
              ),
              child: Text(
                "Your notes, for you to be redefined!",
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue With Google",
                      style: TextStyle(
                        fontSize: 20.0
                      )
                    ),
                    SizedBox(width: 10.0),
                    Image.asset(
                      'assets/images/google.png',
                      height: 36.0,
                    )
                  ]
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0))),
              )
            ),
            SizedBox(height: 10.0)
          ]
        )
      )
    );
  }
}