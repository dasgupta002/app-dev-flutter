import 'package:flutter/material.dart';
import '../services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  void setupTime() async {
    Time instance = Time(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            )
      )
    );
  }
}