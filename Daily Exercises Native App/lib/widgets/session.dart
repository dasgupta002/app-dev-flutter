import 'package:flutter/material.dart';
import '../constants/theme.dart';

class Session extends StatelessWidget {
  final String number;
  final bool isDone;

  Session({ this.number, this.isDone = false });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          width: constraint.maxWidth * 0.50 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 17), 
                blurRadius: 23.0, 
                spreadRadius: -13.0
              )
            ]
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42.0,
                      width: 43.0,
                      decoration: BoxDecoration(
                        color: isDone ? darkColor : Colors.white, 
                        shape: BoxShape.circle, 
                        border: Border.all(
                          color: darkColor
                        )
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : darkColor
                      )
                    ),
                    SizedBox(width: 6.0),
                    Text('Session \n$number')
                  ]
                )
              )
            )
          )  
        )
      );
    });  
  }
}