import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/theme.dart';

class Pills extends StatelessWidget {
  final String title;
  final String path;
  final bool isActive;
  final Function handler;

  Pills({ this.title, this.path, this.isActive, this.handler });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            path,
            color: isActive ? darkColor : textColor
          ),
          Text(
            title,
            style: TextStyle(
            color: isActive ? activeColor : textColor
          ) 
        )
      ]
     )
    );
  }
}