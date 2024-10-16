import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyNotifierState(),
      child: MaterialApp(
        title: 'Timer app newwww',
        theme: ThemeData(
          fontFamily: 'Lato',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 67, 34, 255)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// ...

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = AlarmPage();
      case 1:
        page = WorldClockPage();
      case 2:
        page = StopWatch();
      case 3:
        page = TimePage();
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.access_alarm_outlined), label: "Alarm"),
          NavigationDestination(
              icon: Icon(Icons.access_time_outlined), label: "World clock"),
          NavigationDestination(
              icon: Icon(Icons.watch_sharp), label: "Stopwatch"),
          NavigationDestination(icon: Icon(Icons.timer), label: "Timer"),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        animationDuration: Duration(milliseconds: 500),
      ),
      body: page,
    );
  }
}
