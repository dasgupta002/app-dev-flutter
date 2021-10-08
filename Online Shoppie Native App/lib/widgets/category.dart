import 'package:flutter/material.dart';
import '../theme/constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> heads = ['Bags', 'Jewellery', 'Cosmetics', 'Footwear'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: heads.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  children: <Widget>[
                    Text(
                      heads[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == index ? textColor : lightColor
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding / 4),
                      height: 2.0,
                      width: 30.0,
                      color: selected == index ? Colors.black : Colors.transparent
                    )
                  ]
                )
              )
            );
        })
      )
    );
  }
}