import 'package:flutter/material.dart';
import '../config/data.dart';
import '../config/theme.dart';

class appDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary,
      padding: EdgeInsets.only(top: 40.0, bottom: 33.0, left: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/user.png')
              ),
              SizedBox(width: 6.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Anosova Semyonovna',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    'Active status',
                    style: TextStyle(
                      color: Colors.white
                    )
                  )
                ]
              )
            ]
          ),
          Column(
            children: menu.map((element) => Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    element['icon'],
                    color: Colors.white,
                    size: 18.0
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    element['tag'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    )
                  )
                ]
              )
            )).toList()
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.settings,
                color: Colors.white
              ),
              SizedBox(width: 6.0),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white
                )
              ),
              SizedBox(width: 11.0),
              Container(
                width: 2.0,
                height: 27.0,
                color: Colors.white
              ),
              SizedBox(width: 11.0),
              Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white
                )
              )
            ]
          )
        ]
      )      
    );
  }
}