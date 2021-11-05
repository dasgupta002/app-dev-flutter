import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/search.dart';
import '../widgets/category.dart';
import '../widgets/card.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isOpen = false;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(isOpen ? 33.0 : 0.0)
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isOpen ? IconButton(
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isOpen = false;
                        });
                      }, 
                      icon: Icon(Icons.arrow_back_ios_new)
                    ) : IconButton(
                      onPressed: () {
                        setState(() {
                          xOffset = 202;
                          yOffset = 116;
                          scaleFactor = 0.6;
                          isOpen = true;
                        });
                      }, 
                      icon: Icon(Icons.menu)
                    ),
                    Column(
                      children: <Widget>[
                        Text('Location'),
                        SizedBox(height: 4.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: primary
                            ),
                            Text('Kyiv, Ukraine')
                          ]
                        )                      
                      ]
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/user.png')
                    )                                
                  ]
                )
              ),
              searchBar(),
              categorySearch(),
              petCard(name: 'Sola', path: 'images/pet-cat1.png', distance: 'Distance 3.6 km', age: '2 years old', weight: 1),
              petCard(name: 'Orion', path: 'images/pet-cat2.png', distance: 'Distance 7.8 km', age: '1.5 years old', weight: 2),
              SizedBox(height: 44.0)
            ]
          )
        )
      )
    );
  }
}