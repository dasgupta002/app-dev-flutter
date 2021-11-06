import 'package:flutter/material.dart';
import '../theme/constants.dart';
import './rating.dart';
import './circular.dart';

class HeaderInfo extends StatelessWidget {
  final Size size;
  
  HeaderInfo({ required this.size });

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Crushing And',
                  style: Theme.of(context).textTheme.headline5
                )
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.005),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  'Influence',
                  style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)
                )
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.3,
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Text(
                          'When the earth was flat andeveryone wanted to win the gameof the best and people and winning with an A game with all the things you have.',
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: lightColor
                          )
                        )
                      ),
                      circularRead()
                    ]
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {}
                      ),
                      Positioned(
                        top: 37.0,
                        right: 11.0,
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {}, 
                              icon: Icon(Icons.favorite_border)
                            ),
                            Rating(star: '4.9')
                          ]
                        )
                      )
                    ]
                  )
                ]
              )
            ]
          )
        ),
      ]
    );
  } 
}