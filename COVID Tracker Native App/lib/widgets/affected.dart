import 'package:flutter/material.dart';

class Affected extends StatelessWidget {
  final List data;

  Affected({ required this.data });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 11.0, vertical: 11.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  data[index]['countryInfo']['flag'],
                  height: 22.0,
                  width: 66.0
                ),
                SizedBox(width: 11.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data[index]['country'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Deaths: ' + data[index]['deaths'].toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              ]
            )
          );
        }
      )     
    );
  }
}