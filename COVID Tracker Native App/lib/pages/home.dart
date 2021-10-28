import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/source.dart';
import '../widgets/stats.dart';
import '../widgets/affected.dart';
import '../widgets/info.dart';
import '../pages/country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldStats = {};
  List worstHits = [];
  
  fetchCOVIDStats() async {
    http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/all'));
    
    setState(() {
      worldStats = json.decode(response.body);
    });
  }
  
  fetchWorstAffected() async {
    http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries?sort=deaths'));

    setState(() {
      worstHits = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();

    fetchCOVIDStats();
    fetchWorstAffected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff202c3b),
        title: Text('COVIFACTO'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light ? Icons.lightbulb_outline : Icons.highlight),
            onPressed: () {
              AdaptiveTheme.of(context).toggleThemeMode();
            }
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 88.0,
              padding: EdgeInsets.all(11.0),
              color: Colors.orange[100],
              child: Text(
                Emitter.quote,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                )
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WORLDWIDE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    )  
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Country();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(11.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light ? Color(0xff202c3b) : Colors.white,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: Text(
                        'REGIONAL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
                          fontSize: 11.0
                        )  
                      )
                    )
                  )
                ]
              )
            ),
            worldStats.isEmpty ? Padding(
              padding: const EdgeInsets.all(33.0),
              child: Center(
                child: CircularProgressIndicator()
              )
            ) : Stats(data: worldStats),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 11.0),
              child: Text(
                'MOST AFFECTED',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                )  
              )
            ),
            worstHits.isEmpty ? Padding(
              padding: const EdgeInsets.all(33.0),
              child: Center(
                child: CircularProgressIndicator()
              )
            ) : Affected(data: worstHits),
            SizedBox(height: 20.0),
            Info(),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                'WE ARE ALL IN THIS FIGHT AGAINST COVID, NEVER LOOSE HOPE. WE WILL BE SAFER AND WIN OVER THIS PANDEMIC.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0
                )
              )
            ),
            SizedBox(height: 20.0)
          ]
        )
      )
    );
  }
}