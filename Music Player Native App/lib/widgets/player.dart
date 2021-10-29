import 'package:flutter/material.dart';
import '../theme/data.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(icon: Icons.repeat),
          Controls(icon: Icons.skip_previous),
          Play(),
          Controls(icon: Icons.skip_next),
          Controls(icon: Icons.shuffle)
        ]
      )    
    );
  }
}

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.5),
            offset: Offset(5, 10),
            spreadRadius: 3,
            blurRadius: 10
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -4),
            spreadRadius: -2,
            blurRadius: 20
          )
        ]
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: darkColor,
                boxShadow: [
                  BoxShadow(
                    color: darkColor.withOpacity(0.5),
                    offset: Offset(5, 10),
                    spreadRadius: 3,
                    blurRadius: 10
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -4),
                    spreadRadius: -2,
                    blurRadius: 20
                  )
                ]            
              )
            )
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor            
              ),
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  color: darkColor,
                  size: 30.0
                )
              )
            )
          )
        ]
      )
    );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  Controls({ required this.icon });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.5),
            offset: Offset(5, 10),
            spreadRadius: 3,
            blurRadius: 10
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -4),
            spreadRadius: -2,
            blurRadius: 20
          )
        ]
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: darkColor.withOpacity(0.5),
                    offset: Offset(5, 10),
                    spreadRadius: 3,
                    blurRadius: 10
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -4),
                    spreadRadius: -2,
                    blurRadius: 20
                  )
                ]         
              )
            )
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(11.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor            
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: darkColor,
                  size: 14.0
                )
              )
            )
          )
        ]
      )
    );
  }
}