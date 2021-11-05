import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.search),
          Text('Search pet to adopt!'),
          Icon(Icons.settings)
        ]
      )    
    );
  }
}