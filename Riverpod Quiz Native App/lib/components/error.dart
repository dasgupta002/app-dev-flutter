import 'package:flutter/material.dart';

import './button.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback handler;

  ErrorView({ @required this.message, @required this.handler });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message.toString(),
            style: TextStyle(
              color: Colors.white, 
              fontSize: 18.0
            )
          ),
          SizedBox(height: 20.0),
          Button(
            title: 'Retry', 
            handler: handler
          )
        ]
      )
    );
  }
}