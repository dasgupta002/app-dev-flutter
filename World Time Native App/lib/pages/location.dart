import 'package:flutter/material.dart';
import '../services/time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Time> locations = [
    Time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Time(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    Time(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    Time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    Time instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Any Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            ),
          );
        }
      ),
    );
  }
}