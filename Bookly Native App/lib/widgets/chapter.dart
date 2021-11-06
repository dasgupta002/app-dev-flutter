import 'package:flutter/material.dart';
import '../theme/constants.dart';

class Chapter extends StatelessWidget {
  late String title;
  late String tag;
  
  Chapter({ required this.title, required this.tag });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 11.0, bottom: 6.0),
        width: MediaQuery.of(context).size.width - 48,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(38),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 33,
                color: Color(0xFFD3D3D3).withOpacity(0.88))
            ]
        ),
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: blackColor
                    )
                  ),
                  TextSpan(
                    text: tag,
                    style: TextStyle(
                      color: lightColor,
                      fontSize: 11.0
                    )
                  )
                ]
              )
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios, 
                size: 18
              ), 
              onPressed: () {}
            )
        ]
      )
    );
  }
}