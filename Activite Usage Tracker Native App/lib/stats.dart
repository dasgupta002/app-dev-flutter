import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:usage_stats/usage_stats.dart';

class Stats extends StatefulWidget {
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<EventUsageInfo> events = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((context) => init());
  }

  Future<void> init() async {
    UsageStats.grantUsagePermission();
    DateTime startDate = DateTime(2022, 1, 1, 0, 0, 0);
    DateTime endDate = new DateTime.now();

    List<EventUsageInfo> queryEvents = await UsageStats.queryEvents(startDate, endDate);

    setState(() {
      events = queryEvents.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Activite Usage Tracker',
          style: TextStyle(
            color: Colors.white
          )
        ),
        backgroundColor: Colors.orange
      ),
      body: Container(
        child: ListView.separated(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(events[index].packageName.toString()),
              subtitle: Text('Last time used was ' + Jiffy(DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp.toString()))).fromNow() + '.'),
            );
          },
          separatorBuilder: (context, index) => Divider()
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => init(),
        child: Icon(
          Icons.refresh,
          color: Colors.white
        ),
        mini: true
      )
    );
  }
}