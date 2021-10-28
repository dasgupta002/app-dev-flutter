import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/search.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List countryStats = [];
  
  fetchCountryStats() async {
    http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));
    
    setState(() {
      countryStats = json.decode(response.body);
    });
  }
  
  @override
  void initState() {
    super.initState();
    fetchCountryStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202c3b),
        title: Text('Country Statistics'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(data: countryStats));              
            }, 
            icon: Icon(Icons.search)
          )
        ]
      ),
      body: countryStats.isEmpty ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: countryStats.length,
        itemBuilder: (context, index) {
          return Container(
            height: 137.0,
            margin: EdgeInsets.symmetric(horizontal: 11.0, vertical: 11.0),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light ? Colors.yellow[100] : Color(0xff202c3b),
              borderRadius: BorderRadius.circular(22.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 11,
                  color: Color(0xffD3D3D3)
                )
              ]
            ),            
            child: Row(
              children: <Widget>[
                Container(
                  width: 112.0,
                  margin: EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        countryStats[index]['country'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(height: 5.0),
                      Image.network(
                        countryStats[index]['countryInfo']['flag'],
                        height: 50.0,
                        width: 60.0      
                      ),
                    ],
                  )
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CONFIRMED: ' +  countryStats[index]['cases'].toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(
                          'ACTIVE: ' +  countryStats[index]['active'].toString(),
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(
                          'RECOVERED: ' +  countryStats[index]['recovered'].toString(),
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(
                          'DEATHS: ' +  countryStats[index]['deaths'].toString(),
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light ? Colors.grey[800] : Colors.grey[200],
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    )
                  )
                )
              ]
            )
          );
        }
      )
    );
  }
}