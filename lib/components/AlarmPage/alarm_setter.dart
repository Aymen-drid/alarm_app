import 'package:flutter/material.dart';
import 'calenderExemples/calender.dart';

class AlarmSetter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlarmSetter();
}

class _AlarmSetter extends State<AlarmSetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Set Alarm'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Return to the previous page
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(children: [
          ListTile(
            title: Text('Calendar Basics  1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableBasicsExample()),
              );
            },
          ),
          ListTile(
            title: Text('Calendar Multi 2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableMultiExample()),
              );
            },
          ),
          ListTile(
            title: Text('Calendar Range 3'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableRangeExample()),
              );
            },
          ),
          ListTile(
            title: Text('Calendar Events 4'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableEventsExample()),
              );
            },
          ),
          ListTile(
            title: Text('Calendar Complex 5'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableComplexExample()),
              );
            },
          ),
        ]));
  }
}
