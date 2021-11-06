import 'package:bookly/widgets/best.dart';
import 'package:flutter/material.dart';
import './detail.dart';
import '../widgets/book.dart';
import '../widgets/continue.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main_page_bg.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline5,
                        children: [
                          TextSpan(text: 'What are you \n reading'),
                          TextSpan(
                            text: ' today?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      )
                    )
                  ),
                  SizedBox(height: 30.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Book(path: 'assets/images/book-1.png', title: 'Crushing And Influence \n', author: 'Gary Venchuk', handler: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Detail();
                          }));
                        }),
                        Book(path: 'assets/images/book-2.png', title: 'Top Ten Business Hacks \n', author: 'Herman Joel', rating: 4.4, handler: () {}),
                        SizedBox(width: 30.0)
                      ]
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: [
                              TextSpan(text: 'Best of the '),
                              TextSpan(
                                text: 'day',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ]
                          )
                        ),
                        bestPick(),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: [
                              TextSpan(text: 'Continue '),
                              TextSpan(
                                text: 'reading ...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ]
                          )
                        ),
                        SizedBox(height: 22.0),
                        continueReading(),
                        SizedBox(height: 44.0)
                      ]
                    )
                  )          
                ]
              )
            )
          ]
        )
      )
    );
  }
}