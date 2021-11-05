import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../pages/info.dart';

class petCard extends StatelessWidget {
  late String name;
  late String path;
  late String distance;
  late String age;
  late int weight;

  petCard({ required this.name, required this.path, required this.distance, required this.age, required this.weight });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return petInfo();
        }));
      },
      child: Container(
        height: 204.0,
        margin: EdgeInsets.symmetric(horizontal: 22.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 33.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: shadow
                    )
                  ),
                  Align(
                    child: Hero(
                      tag: weight,
                      child: Image.asset(path)
                    )
                  )
                ]
              )
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22.0),
                    bottomRight: Radius.circular(22.0)
                  ),
                  boxShadow: shadow
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
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
                    ),
                    SizedBox(height: 6.0),
                    Padding(
                      padding: EdgeInsets.only(left: 11.0),
                      child: Text('Abyssinian cat') 
                    ),
                    SizedBox(height: 4.0),
                    Padding(
                      padding: EdgeInsets.only(left: 11.0),
                      child: Text(
                        age,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey
                        )
                      ) 
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(left: 11.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: primary
                          ),
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey
                            )
                          )
                        ]
                      )
                    )
                  ]
                )
              )
            )
          ]
        )    
      ),
    );
  }
}