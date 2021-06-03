import 'package:flutter/material.dart';
import 'package:siti/dashboard/dashboard.dart';
import 'package:siti/dashboard/dashboard2.dart';
import 'package:provider/provider.dart ';
import 'package:siti/mqtt_client/mqttC.dart';

class TableData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MQTTManager(),
        )
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
    final pay = Provider.of<MQTTManager>(context);

    var topic1 = "F01/R01/M01";
    var topic2 = "F01/R01/M02";
    pay.connectMQTT(topic1 + "/flow"); var pyloadM1 = double.parse(pay.payload);
    pay.connectMQTT2(topic2 + "/flow"); var pyloadM2 = double.parse(pay.payload2);


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
                    'Connecter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Production',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    '  Detail',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('F01/R01/M01')),
                  DataCell(Text('\r\r\r\r\r\r\r ${etat(pyloadM1)}')),
                  DataCell(Text('${pyloadM1.toString()} u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GaugeApp()),
                      );
                    },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M02')),
                  DataCell(Text('\r\r\r\r\r\r\r ${etat(pyloadM2)}')),
                  DataCell(Text('${pyloadM2.toString()} u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GaugeApp2()),
                      );
                    },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M03')),
                  DataCell(Text('\r\r\r\r\r\r\r N')),
                  DataCell(Text('0.0 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M04')),
                  DataCell(Text('\r\r\r\r\r\r\r N')),
                  DataCell(Text('0.0 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M05')),
                  DataCell(Text('\r\r\r\r\r\r\r C')),
                  DataCell(Text('100 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M06')),
                  DataCell(Text('\r\r\r\r\r\r\r N')),
                  DataCell(Text('100 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M07')),
                  DataCell(Text('\r\r\r\r\r\r\r C')),
                  DataCell(Text('100 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M08')),
                  DataCell(Text('\r\r\r\r\r\r\r C')),
                  DataCell(Text('100 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
                ]),

                DataRow(cells: [
                  DataCell(Text('F01/R01/M09')),
                  DataCell(Text('\r\r\r\r\r\r\r N')),
                  DataCell(Text('00 u/min')),
                  DataCell(TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () { print('ana btn 9 <==='); },
                    child: Icon(
                      Icons.show_chart_rounded,
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  )),
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