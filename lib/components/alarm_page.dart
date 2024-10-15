import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'AlarmPage/alarm_setter.dart';

class AlarmPage extends StatefulWidget {
  @override
  State<AlarmPage> createState() => _AlarmPage();
}

class _AlarmPage extends State<AlarmPage> {
  DateTime dateTime = DateTime.now();
  DateTime ring = DateTime.now().add(Duration(days: 3));
  String nextAlarm = '';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyNotifierState>();
    var alarms = appState.alarms;
    bool alarmOn = appState.alarms.isNotEmpty;

    Duration difference = ring.difference(dateTime);
    nextAlarm = alarmOn
        ? 'Ring in  ${difference.inHours % 24} hours ${difference.inMinutes % 60} minute '
        : 'No alarms on';
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: Center(
        child: Column(
          // Center horizontally,
          children: [
            AnalogClock(
              showAllNumbers: true,
              showNumbers: true,
              secondHandColor: Colors.blue,
              width: 300,
              height: 300,
              isLive: true,
              decoration:
                  BoxDecoration(color: Colors.cyan[80], shape: BoxShape.circle),
              datetime: dateTime,
              showDigitalClock: false,
            ),
            SizedBox(height: 24),
            Text(
              nextAlarm,
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: alarms.length, // Number of RingManaging widgets
                  itemBuilder: (context, index) {
                    return alarms[index]; // Display each RingManaging widget
                  }),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 84, 174, 247),
                  shape: BoxShape.circle),
              child: IconButton(
                iconSize: 26,
                tooltip: 'Add a new alarm',
                onPressed: () {
                  count += 1;
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlarmSetter()),
                  );
                },
                icon: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Ring {
  final String time;
  final String des;

  Ring(this.time, this.des);
}

class MyNotifierState extends ChangeNotifier {
  var alarms = <RingManaging>[];
  void addNewAlarm(RingManaging ring) {
    alarms.add(ring);

    notifyListeners();
  }

  void removeAlarm(String id) {
    alarms.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}

class RingManaging extends StatefulWidget {
  final Ring ring;
  final String id = Uuid().v4();
  RingManaging({super.key, required this.ring});
  @override
  State<RingManaging> createState() => _RingManagement();
}

class _RingManagement extends State<RingManaging> {
  bool enableD = true;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyNotifierState>();
    return ListTile(
        enabled: enableD,
        isThreeLine: false,
        dense: false,
        onLongPress: () {
          appState.removeAlarm(widget.id);
        },
        onTap: () {},
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.alarm_on)),
        trailing: Switch(
          value: enableD,
          activeColor: const Color.fromARGB(255, 84, 174, 247),
          onChanged: (bool value) {
            setState(() {
              enableD = value;
            });
          },
        ),
        title: Text(widget.ring.time),
        subtitle: Text(widget.ring.des));
  }
}
