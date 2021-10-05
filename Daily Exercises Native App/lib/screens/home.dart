import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/category.dart';
import './content.dart';
import '../widgets/navigation.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.55,
            decoration: BoxDecoration(
              color: Color(0xFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png')
              )
            )
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight, 
                    child: Container(
                      width: 52.0,
                      height: 52.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF2BEA1),
                        shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg')
                    )
                  ),
                  Text(
                    'Good Morning \nVikrant!',
                    style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w900)
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    padding: EdgeInsets.symmetric(horizontal: 17.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: SvgPicture.asset('assets/icons/search.svg'),
                        hintText: 'Search',
                        border: InputBorder.none
                      )
                    )
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.87,
                      mainAxisSpacing: 22.0,
                      crossAxisSpacing: 22.0,
                      children: <Widget>[
                        Category(title: 'Diet Charts', path: 'assets/icons/Hamburger.svg', handler: () {}),
                        Category(title: 'Kegel Exercises', path: 'assets/icons/Excrecises.svg', handler: () {}),
                        Category(title: 'Meditation', path: 'assets/icons/Meditation_women_small.svg', handler: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Content();
                          }));
                        }),
                        Category(title: 'Yoga', path: 'assets/icons/yoga.svg', handler: () {})
                      ]
                    )
                  )
                ]
              )
            )
          )
        ]
      ),
      bottomNavigationBar: Navigation()     
    );
  }
}