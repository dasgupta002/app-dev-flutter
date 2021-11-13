import 'package:flutter/material.dart';
import '../theme/data.dart';
import './login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/hero.jpg',
              height: 250.0
            ),
            SizedBox(height: 22.0),
            Text(
              'Welcome to TGD !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white
              )
            ),
            SizedBox(height: 22.0),
            Text(
              'One hood to learn anything you need on demand from SCRATCH!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white
              )
            ),
            SizedBox(height: 22.0),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
              height: 40.0,
              elevation: 0,
              textColor: Colors.white,
              color: logoColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                    )
                  ),
                  SizedBox(width: 11.0),
                  Icon(Icons.arrow_forward_ios)     
                ]
              )
            )
          ]
        )
      )    
    );
  }
}