import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List data = [];

  Search({ required this.data });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = data.where((element) => element['country'].toString().toLowerCase() == query).toList();

    return ListView.builder(
      itemCount: result.length,
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
                      result[index]['country'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 5.0),
                    Image.network(
                      result[index]['countryInfo']['flag'],
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
                        'CONFIRMED: ' +  result[index]['cases'].toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        'ACTIVE: ' +  result[index]['active'].toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        'RECOVERED: ' +  result[index]['recovered'].toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        'DEATHS: ' +  result[index]['deaths'].toString(),
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
    );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? data : data.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestions.length,
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
                      suggestions[index]['country'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 5.0),
                    Image.network(
                      suggestions[index]['countryInfo']['flag'],
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
                        'CONFIRMED: ' +  suggestions[index]['cases'].toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        'ACTIVE: ' +  suggestions[index]['active'].toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        'RECOVERED: ' +  suggestions[index]['recovered'].toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        'DEATHS: ' +  suggestions[index]['deaths'].toString(),
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
    );
  }
}