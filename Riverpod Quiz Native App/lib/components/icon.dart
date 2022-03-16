import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color color;  
  
  CircularIcon({ @required this.icon, @required this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 2),
          blurRadius: 4.0
        )],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16.0
      )     
    );
  }
}