import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/theme.dart';
import '../widgets/session.dart';
import '../widgets/navigation.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: lightColor,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/meditation_bg.png')
              )
            )
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.05),
                    Text(
                      'Meditation',
                      style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w900)
                    ),
                    Text(
                      '3-10 MIN Course',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text('Live happier and healthier by learning the fundamentals of meditation and mindfullness.')
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Container(
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
                      )
                    ),
                    Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: <Widget>[
                        Session(number: 'One', isDone: true),
                        Session(number: 'Two'),
                        Session(number: 'Three'),
                        Session(number: 'Four'),
                        Session(number: 'Five'),
                        Session(number: 'Six')
                      ]
                    ),
                    SizedBox(height: 22.0),
                    Text(
                      'Meditation',
                      style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold)
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      padding: EdgeInsets.all(11.0),
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(13.0), 
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            offset: Offset(0, 17), 
                            blurRadius: 23.0, 
                            spreadRadius: -13.0
                          )
                        ]
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/icons/Meditation_women_small.svg'),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Basic 2',
                                  style: Theme.of(context).textTheme.subtitle1
                                ),
                                Text('Start your practise!')
                              ]
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: SvgPicture.asset('assets/icons/Lock.svg')
                          )
                        ]
                      )
                    )
                  ]
                )
              )
            )
          )
        ]
      ),
      bottomNavigationBar: Navigation()     
    );
  }
}