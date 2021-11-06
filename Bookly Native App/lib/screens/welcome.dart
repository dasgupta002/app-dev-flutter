import 'package:flutter/material.dart';
import './home.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bitmap.png'),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: [
                  TextSpan(
                    text: 'Book'
                  ),
                  TextSpan(
                    text: 'ly',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ]
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));  
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 17.0),
                  padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 30,
                        color: Color(0xFF666666).withOpacity(0.11)
                      )
                    ]
                  ),
                  child: Text(
                    'Start reading!',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              )
            )          
          ]
        )
      )
    );
  }
}