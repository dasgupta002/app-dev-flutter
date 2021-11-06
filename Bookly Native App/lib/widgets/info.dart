import 'package:flutter/material.dart';
import '../theme/constants.dart';
import './rating.dart';
import './circular.dart';

class bookInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Crushing And",
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 22.0),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    "Influence",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                          child: Text(
                            "When the earth was flat and everyone wanted to win the game of the best and winning is the only thing you have.",
                            maxLines: 7,
                            textAlign: TextAlign.justify,
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
                          icon: Icon(
                            Icons.favorite_border, 
                            size: 20, 
                            color: Colors.grey
                          ),
                          onPressed: () {}
                        ), 
                        Rating(star: '4.9')
                      ]
                    )
                  ]  
                )
              ]
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: Image.asset(
                "assets/images/book-1.png",
                height: double.infinity,
                alignment: Alignment.topRight,
                fit: BoxFit.fitWidth
              )
            )
          )
        ]
      )
    );
  }
}