import 'package:flutter/material.dart';
import '../theme/constants.dart';

class Rating extends StatelessWidget {
  late String star;
  
  Rating({ required this.star });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFFD3D3D3).withOpacity(0.50)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.star,
            color: iconColor
          ),
          SizedBox(height: 6.0),
          Text(
            star,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold
            )
          )
        ]
      )
    );
  }
}