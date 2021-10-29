import 'package:flutter/material.dart';
import '../theme/data.dart';

class Album extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244.0,
      width: 244.0,
      padding: EdgeInsets.all(14.0),
      margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 44.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(22.0),
        boxShadow: [
          BoxShadow(
            color: darkColor,
            offset: Offset(18, 6),
            spreadRadius: 3,
            blurRadius: 25
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -4),
            spreadRadius: -2,
            blurRadius: 20
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.0),
        child: Image.asset(
          'images/snap.png',
          fit: BoxFit.fill
        )
      )    
    );
  }
}