import 'package:flutter/material.dart';
import '../theme/constants.dart';

class continueReading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 11),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(0.88)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Crushing And Influence',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text(
                            'Gary Venchuk',
                            style: TextStyle(
                              color: lightColor
                            )
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Chapters Seven to Ten',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: lightColor
                              )  
                            )
                          ),
                          SizedBox(height: 6)
                        ]
                      )
                    ),
                    Image.asset(
                      'assets/images/book-1.png',
                      width: 55
                    )
                  ]
                )
              )
            ),
            Container(
              height: 7,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: progressIndicator,
                borderRadius: BorderRadius.circular(7)
              )
            )
          ]
        )
      )
    );
  }
}