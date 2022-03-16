import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback handler;

  Button({ @required this.title, @required this.handler });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        margin: EdgeInsets.all(20.0),
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          boxShadow: [BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 4.0
          )],
          borderRadius: BorderRadius.circular(25.0)
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600
          )
        )
      )     
    );
  }
}