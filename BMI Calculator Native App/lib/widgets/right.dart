import 'package:flutter/material.dart';
import '../theme/constants.dart';

class RightBar extends StatelessWidget {
  final double width;

  const RightBar({ @required this.width });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25.0,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: accentColor
          )
        )
      ]
    );
  }
}