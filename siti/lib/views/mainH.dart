import 'package:siti/views/pageH/editable_page.dart';
import 'package:siti/views/pageH/editable_page2.dart';
import 'package:siti/views/widgetH/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siti/dashboard/dashboard.dart';
Future main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  static final String title = 'Data Table';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Siti Plus',
        tabs: [
          Tab(icon: Icon(Icons.show_chart_rounded), text: 'Machines'),
          Tab(icon: Icon(Icons.speed_sharp), text: 'Dashboard'),
          Tab(icon: Icon(Icons.edit), text: 'Justifications'),
        ],

        children: [
          TableData(),
          GaugeApp(),
          EditablePage2(),
        ],
      );
}
