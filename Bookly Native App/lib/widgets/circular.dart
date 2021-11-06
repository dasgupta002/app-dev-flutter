import 'package:flutter/material.dart';

class circularRead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.018),
      padding: EdgeInsets.only(left: 4.0, right: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0)
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Read', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        )
      )
    );
  }
}