import 'package:flutter/material.dart';
import '../theme/constants.dart';
import '../widgets/rating.dart';
import '../widgets/rounded.dart';

class Book extends StatelessWidget {
  final String path;
  final String title;
  final String author;
  final double rating;
  final Function()? handler;

  Book({ required this.path, required this.title, required this.author, this.rating = 4.9, required this.handler });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 246.0,
      width: 205.0,
      margin: EdgeInsets.only(left: 25.0, bottom: 33.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 225.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Color(0xFFD3D3D3).withOpacity(0.86)
                  )
                ]
              )
            )
          ),
          Image.asset(
            path,
            width: 150.0
          ),
          Positioned(
            top: 37.0,
            right: 11.0,
            child: Column(
              children: <Widget>[
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.favorite_border)
                ),
                Rating(star: rating.toString())
              ]
            )
          ),
          Positioned(
            top: 164,
            child: Container(
              height: 88.0,
              width: 206.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: blackColor),
                        children: [
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          ),
                          TextSpan(
                            text: author,
                              style: TextStyle(
                                color: lightColor
                              )
                          )
                        ]
                      )
                    )
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: handler,
                        child: Container(
                          width: 106,
                          padding: EdgeInsets.symmetric(vertical: 11.0),
                          alignment: Alignment.center,
                          child: Text('Details')
                        )
                      ),
                      Expanded(
                        child: roundedRead(handler: handler)
                      )
                    ]
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}