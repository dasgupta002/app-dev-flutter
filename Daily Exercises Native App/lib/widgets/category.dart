import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/theme.dart';

class Category extends StatelessWidget {
  final String title;
  final String path;
  final Function handler;

  Category({ this.title, this.path, this.handler });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(13.0), 
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: Offset(0, 17), 
              blurRadius: 17.0, 
              spreadRadius: -23.0
            )
          ]
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: handler,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(path),
                  Spacer(),
                  Text(
                    title, 
                    style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 15.0)
                  )
                ]            
              )
            )
          )
        )  
      )
    );
  }
}