import 'package:flutter/material.dart';
import './theme/data.dart';
import './widgets/nav.dart';
import './widgets/album.dart';
import './widgets/player.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splitz Tunes',
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double minutes = 2.37;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Nav(),
          Container(
            height: height / 2,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Album();
              }
            )
          ),
          Text(
            'Joy of Little Things',
            style: TextStyle(
              color: darkColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            )
          ),   
          Text(
            'When Chai Met Toast',
            style: TextStyle(
              color: darkColor,
              fontSize: 11.0,
              fontWeight: FontWeight.w400
            )
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0)
            ),
            child: Slider(
              value: minutes, 
              activeColor: darkColor,
              inactiveColor: darkColor.withOpacity(0.3),
              onChanged: (value) {
                setState(() {
                  minutes = value;
                });
              },
              min: 0.00,
              max: 4.55
            )
          ),
          Player(),
          SizedBox(height: 33.0)  
        ]
      )
    );
  }
}