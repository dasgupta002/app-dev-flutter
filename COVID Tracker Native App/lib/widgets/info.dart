import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/faq.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FAQ();
              }));              
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 11.0),
              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 11.0),
              color: Theme.of(context).brightness == Brightness.light ? Color(0xff202c3b) : Colors.brown[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "FAQ's",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white
                    )
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white
                  )
                ]
              )
            )
          ),
          GestureDetector(
            onTap: () {
              launch('https://donate.covid19responsefund.org/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 11.0),
              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 11.0),
              color: Theme.of(context).brightness == Brightness.light ? Color(0xff202c3b) : Colors.brown[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "DONATE(to WHO's website directly)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white
                    )
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white
                  )
                ]
              )
            )
          ),
          GestureDetector(
            onTap: () {
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 11.0),
              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 11.0),
              color: Theme.of(context).brightness == Brightness.light ? Color(0xff202c3b) : Colors.brown[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "MYTH BUSTERS(rumors cleared)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white
                    )
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white
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