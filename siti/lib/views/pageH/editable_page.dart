import 'package:flutter/material.dart';
import 'package:siti/dashboard/dashboard.dart';
import 'package:siti/dashboard/dashboard2.dart';
import 'package:provider/provider.dart ';
import 'package:siti/mqtt_client/Reciveds/topic1.dart';
import 'package:siti/mqtt_client/Reciveds/topic2.dart';
import 'package:siti/mqtt_client/Reciveds/topic3.dart';
import 'package:siti/mqtt_client/Reciveds/topic4.dart';
import 'package:siti/mqtt_client/Reciveds/topic5.dart';
import 'package:siti/mqtt_client/Reciveds/topic6.dart';
import 'package:siti/mqtt_client/Reciveds/topic7.dart';
import 'package:siti/mqtt_client/Reciveds/topic8.dart';
import 'package:siti/mqtt_client/Reciveds/topic9.dart';

class TableData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MQTTManager1(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager2(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager3(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager4(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager5(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager6(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager7(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager8(),
        ),
        ChangeNotifierProvider(
          create: (_) => MQTTManager9(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Radial Gauge Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Machines(),
      ),
    );
  }
}

class Machines extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();

}

class _DataTableExample extends State<Machines> {
  @override
  Widget build(BuildContext context) {
    final pay1 = Provider.of<MQTTManager1>(context); pay1.connectMQTT();
    final pay2 = Provider.of<MQTTManager2>(context); pay2.connectMQTT();
    final pay3 = Provider.of<MQTTManager3>(context); pay3.connectMQTT();
    final pay4 = Provider.of<MQTTManager4>(context); pay4.connectMQTT();
    final pay5 = Provider.of<MQTTManager5>(context); pay5.connectMQTT();
    final pay6 = Provider.of<MQTTManager6>(context); pay6.connectMQTT();
    final pay7 = Provider.of<MQTTManager7>(context); pay7.connectMQTT();
    final pay8 = Provider.of<MQTTManager8>(context); pay8.connectMQTT();
    final pay9 = Provider.of<MQTTManager9>(context); pay9.connectMQTT();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          body: ListView(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 0),),
            Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columnSpacing: 10,
              columns: [
                DataColumn(label: Text(
                    '\rMachine',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    '\r\r\rConnecter?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    '\r\r\r\r\r\r\r\rProduction',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),

              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('F01/R01/M01')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay1.isConnected}')),//${etat(pyloadM1)}
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r ${pay1.payload} u/min')),//${pyloadM1.toString()}

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M02')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay2.isConnected}')), //${etat(pyloadM2)}
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay2.payload} u/min')), //${pyloadM2.toString()}

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M03')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay3.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay3.payload} u/min')),

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M04')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay4.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay4.payload} u/min')),

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M05')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay5.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay5.payload} u/min')),

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M06')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay6.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay6.payload} u/min')),

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M07')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay7.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay7.payload} u/min')),

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M08')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay8.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay8.payload} u/min')),

                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M09')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r${pay9.isConnected}')),
                  DataCell(Text('\r\r\r\r\r\r\r\r\r\r\r\r${pay9.payload} u/min')),

                ]),

              ],
            ),
          ])
      ),
    );
  }
}

String etat(double pyload){
  if(pyload == 0){
    return "N";
  }else{
    return "C";
  }
}