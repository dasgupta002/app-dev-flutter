import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final Map data;

  Stats({ required this.data });

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.0, vertical: 14.0),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          Figures(background: Colors.red[100], text: Colors.red, title: 'CONFIRMED', count: data['cases'].toString()),
          Figures(background: Colors.blue[100], text: Colors.blue, title: 'ACTIVE', count: data['active'].toString()),
          Figures(background: Colors.green[100], text: Colors.green, title: 'RECOVERED', count: data['recovered'].toString()),
          Figures(background: Colors.grey[300], text: Colors.grey, title: 'DEATHS', count: data['deaths'].toString())
        ]
      )    
    );
  }
}

class Figures extends StatelessWidget {
  final Color? background;
  final Color text;
  final String title;
  final String count;

  Figures({ required this.background, required this.text, required this.title, required this.count });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      height: 88.0,
      width: width / 2,
      color: background,
      margin: EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: text
            )
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: text
            )
          )
        ]
      )
    );
  }
}