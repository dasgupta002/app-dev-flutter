import 'package:flutter/material.dart';
import '../theme/constants.dart';
import '../widgets/info.dart';
import '../widgets/chapter.dart';
import '../widgets/might.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: size.height * 0.53,
                  padding: EdgeInsets.only(top: size.height * 0.12, left: size.width * 0.1, right: size.width * 0.02),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.fitWidth
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                    )
                  ),
                  child: bookInfo()
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.49),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Chapter(title: 'Chapter 1 : Money \n', tag: 'Life is about change'),
                      Chapter(title: 'Chapter 2 : Power \n', tag: 'Everything loves power'),
                      Chapter(title: 'Chapter 3 : Influence \n', tag: 'Influence easily like never before'),
                      Chapter(title: 'Chapter 4 : Win \n', tag: 'Winning is what matters'),
                      SizedBox(height: 26.0)
                    ]
                  )   
                ),
              ]
            ),
            mightAlso(),
            SizedBox(height: 44.0)
          ]
        )
      )
    );
  }
}