import 'package:flutter/material.dart';
import '../config/data.dart';
import '../config/theme.dart';

class categorySearch extends StatefulWidget {
  @override
  State<categorySearch> createState() => _categorySearchState();
}

class _categorySearchState extends State<categorySearch> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.0,
      margin: EdgeInsets.only(top: 14.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(14.0),
                    margin: EdgeInsets.only(left: 6.0, right: 6.0),
                    decoration: BoxDecoration(
                      color: selected == index ? primary : Colors.white,
                      borderRadius: BorderRadius.circular(11.0),
                      boxShadow: shadow
                    ),
                    child: Image.asset(
                      categories[index]['icon'],
                      height: 45.0,
                      width: 40.0,
                      color: selected == index ? Colors.white : Colors.green[700]
                    )
                  ),
                  SizedBox(height: 4.0),
                  Text(categories[index]['name'])
                ]
              )
            )
          );
        }
      )    
    );
  }
}