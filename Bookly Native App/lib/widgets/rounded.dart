import 'package:flutter/material.dart';
import '../theme/constants.dart';

class roundedRead extends StatelessWidget {
  late Function()? handler;
  
  roundedRead({ required this.handler });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Text(
          'Read',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}