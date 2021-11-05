import 'package:flutter/material.dart';
import '../config/theme.dart';

class petInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[300]
                  )
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(top: 68.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/seller.png')
                                  ),
                                  SizedBox(width: 6.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Yaryna Vladislavovna',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      Text(
                                        'Owner',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11.0
                                        )
                                      )
                                    ]
                                  )
                                ],
                              ),
                              Text('May 25')
                            ]
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "My job requires moving to another country. I don't have the opportunity to take the cat with me. I am looking for good people who will shelter my Sola.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0
                              )
                            ),
                          )
                        ]
                      )
                    )
                  )
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    icon: Icon(Icons.arrow_back_ios_new)
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.share)
                  )
                ]
              )
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 1,
                child: Image.asset('images/pet-cat1.png')
              )
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 110.0,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0),
                boxShadow: shadow
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Sola',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Icon(
                          Icons.female,
                          size: 27.0  
                        )
                      ]
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Abyssinian cat'),
                        Text('2 years old')
                      ]
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: primary
                        ),
                        Text(
                          '5 Bulvarno-Kudriavska Street, Kyiv',
                          style: TextStyle(
                            color: Colors.grey
                          )
                        )
                      ]
                    )
                  ]
                )
              )
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 88.0,
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(44),
                  topRight: Radius.circular(44)
                )
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(22.0)
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white
                    )
                  ),
                  SizedBox(width: 6.0),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(11.0)
                      ),
                      child: Center(
                        child: Text(
                          'Adoption',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0
                          )  
                        )
                      )
                    )
                  )
                ]
              )
            )
          )
        ]
      )    
    );
  }
}