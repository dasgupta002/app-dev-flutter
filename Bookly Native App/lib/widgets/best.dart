import 'package:flutter/material.dart';
import '../theme/constants.dart';
import './rounded.dart';
import './rating.dart';

class bestPick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 266,
      margin: EdgeInsets.symmetric(vertical: 22.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 244,
              width: double.infinity,
              padding: EdgeInsets.only(left: 25.0, top: 25.0, right: MediaQuery.of(context).size.width * 0.22),
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(0.44),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 11.0, bottom: 11.0),
                    child: Text(
                      'New York Time Best For Ongoing Month',
                      style: TextStyle(
                        fontSize: 10, 
                        color: lightColor
                      )
                    )
                  ),
                  Text(
                   'How To Win \nFriends And Influence',
                    style: Theme.of(context).textTheme.subtitle1
                  ),
                  Text(
                    'Gary Venchuk',
                    style: TextStyle(
                      color: lightColor
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 11.0, bottom: 11.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 11.0),
                          child: Rating(star: '4.9') 
                        ),
                        Expanded(
                          child: Text(
                            'When the earth was flat and everyone wanted to win the game of the best and people….',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11.0, 
                              color: lightColor
                            )
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'assets/images/book-3.png',
              width: MediaQuery.of(context).size.width * 0.30
            )
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 44.0,
              width: MediaQuery.of(context).size.width * 0.3,
              child: roundedRead(handler: () {})
            )  
          )
        ]
      )
    );
  }
}