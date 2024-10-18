import 'package:flutter/material.dart';
import 'calenderExemples/basic.dart';

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
            title: Text('Calendar Complex  1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableBasicsExample()),
              );
            },
          ),
         
        ]));
  }
}
