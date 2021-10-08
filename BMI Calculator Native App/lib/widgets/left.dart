import 'package:flutter/material.dart';
import '../theme/constants.dart';

class LeftBar extends StatelessWidget {
  final double width;

  const LeftBar({ @required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25.0,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: accentColor
          )
        )
      ]
    );
  }
}
