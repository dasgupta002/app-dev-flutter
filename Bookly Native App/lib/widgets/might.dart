import 'package:flutter/material.dart';
import '../theme/constants.dart';
import './circular.dart';
import './rating.dart';

class mightAlso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline6,
              children: [
                TextSpan(text: 'You might also '),
                TextSpan(
                  text: 'like ...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            )
          ),
          SizedBox(height: 22.0),
          Stack(
            children: <Widget>[
              Container(
                height: 188,
                width: double.infinity
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 140.0),
                  height: 188,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFFFF8F9)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: blackColor
                          ),
                          children: [
                            TextSpan(
                              text: 'How To Win \nFriends And Influence \n',
                              style: TextStyle(
                                fontSize: 16.0
                              )
                            ),
                            TextSpan(
                              text: 'Gary Venchuk',
                              style: TextStyle(
                                color: lightColor
                              )
                            )
                          ]
                        )
                      ),
                      SizedBox(height: 11.0),
                      Row(
                        children: <Widget>[
                          Rating(star: '4.7'),
                          SizedBox(width: 11.0),
                          Expanded(
                            child: circularRead()
                          )
                        ]
                      )
                    ]
                  )
                ) 
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/book-3.png',
                  width: 130
                )
              )
            ]
          )
        ]
      )
    );
  }
}            