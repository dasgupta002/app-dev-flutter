import 'package:flutter/material.dart';
import '../theme/data.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.0,
      margin: EdgeInsets.symmetric(horizontal: 22.0),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Pill(icon: Icons.arrow_back_ios),
          Text(
            'Playing now!',
            style: TextStyle(
              fontSize: 17.0,
              color: darkColor,
              fontWeight: FontWeight.w500
            )
          ),
          Pill(icon: Icons.list)
        ]
      )
    );
  }
}

class Pill extends StatelessWidget {
  final IconData icon;

  Pill({ required this.icon });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.0,
      width: 33.0,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(11.0),
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.5),
            offset: Offset(5, 10),
            spreadRadius: 3,
            blurRadius: 10
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -4),
            spreadRadius: -2,
            blurRadius: 20
          )
        ]
      ),
      child: Icon(
        icon,
        color: darkColor
      )    
    );
  }
}