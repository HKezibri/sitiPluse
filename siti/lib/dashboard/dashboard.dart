import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siti/justifications/justification.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';
//import 'package:siti/mqtt_client/mqtt_client.dart';
import 'package:provider/provider.dart ';
import 'package:siti/mqtt_client/mqttC.dart';
class GaugeApp extends StatelessWidget {
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
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //MqttClient client;
  var topic1 = "F01/R01/M01";

  @override
  Widget build(BuildContext context) {

    final pay = Provider.of<MQTTManager>(context);
    var pyloadToDouble = double.parse(pay.getPaload());
    pay.connectMQTT(topic1+"/flow");

    pay.second();
    return Scaffold(
      appBar: AppBar(title: const Text('SitiPlus Dashboard',
          style: TextStyle(
            fontSize: 23.0,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          )
      )),
      body: Container(
        child: ResponsiveGridRow(
            children: [

              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 40,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: Text("F01/R01/M01",style: TextStyle(fontSize: 20.0,
                    color: Colors.black87,
                    fontStyle: FontStyle.italic) ),
                ),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrets \t \r\r\r\r :\t ${pay.s}  \nTotal time :  0 min",
                      style: TextStyle(
                      fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                  )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                    height: 60,
                    alignment: Alignment(0, 0),
                    //color: Colors.blue,
                    child: RaisedButton(onPressed: (){
                    /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DataTableDemo()),
                      );
                      */
                      print("-------------------------------------------- ok");


                      },
                        color: Colors.white70,

                        child: Text("Justifier ?",style: TextStyle(
                            fontSize: 16.0,
                          color: Colors.deepOrange,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic,
                        ))
                        )
                ),
              ),
              ResponsiveGridCol(
                lg: 12,   
                child: Container(
                  height: 193,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: SfRadialGauge(
                    /* title: GaugeTitle(
                      text: 'Machine 01',
                      textStyle:
                      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),*/

                    axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                        interval: 10,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                        pointers: <GaugePointer>[

                          NeedlePointer(value: pyloadToDouble,
                              enableAnimation: true,
                              needleStartWidth: 0,
                              needleEndWidth: 6,
                              needleColor: Color(0xFFDADADA),
                              knobStyle: KnobStyle(
                                  color: Colors.white, borderColor: Color(0xFFDADADA),
                                  knobRadius: 0.06,
                                  borderWidth: 0.04),
                              tailStyle: TailStyle(color: Color(0xFFDADADA), width: 5,
                                  length: 0.15)
                          ),
                          RangePointer(value: pyloadToDouble,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.deepOrange)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay.payload.toString(), style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))]
                    )
                    ],
                  ) ,

                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 230,
                  alignment: Alignment(0, 0),
                  //color: Colors.orange,
                  child:SfCartesianChart(
                      title: ChartTitle(text: 'Machine 1 Production Trafic', textStyle:
                      TextStyle(
                        color: Colors.lightBlue,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      )),

                    // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData, String>(
                            dataSource: [
                              // Bind data source
                              SalesData('15:02:06', 0),
                              SalesData('15:02:08', 28),
                              SalesData('15:02:10', 34),
                              SalesData('15:02:12', 32),
                              SalesData('15:02:20', 80),
                              SalesData('15:02:22', 35),
                              SalesData('15:02:24', 0),
                              SalesData('15:02:26', 0),
                              SalesData('15:02:28', 2),
                              SalesData('15:02:30', 4),
                              SalesData('15:02:32', 8),
                              SalesData('15:02:34', 28),
                              SalesData('15:02:36', 34),
                              SalesData('15:02:38', 32),
                              SalesData('15:02:40', 40),
                              SalesData('15:02:42', 35),
                              SalesData('15:02:44', 77),
                              SalesData('15:02:46', 0),
                              SalesData('15:02:48', 32),
                              SalesData('15:02:50', 0),
                              SalesData('15:02:52', 35),
                              SalesData('15:02:54', 28),
                              SalesData('15:02:56', 34),
                              SalesData('15:02:58', 32),
                              SalesData('15:03:00', 66),
                              SalesData('15:03:22', 35),
                              SalesData('15:03:24', 0),
                              SalesData('15:03:26', 0),
                              SalesData('15:03:28', 2),
                              SalesData('15:03:30', 4),
                              SalesData('15:03:32', 8),
                              SalesData('15:03:34', 3),
                              SalesData('15:03:36', 8),
                              SalesData('15:03:38', 5),
                              SalesData('15:03:40', 2),
                              SalesData('15:03:42', 0),
                              SalesData('15:03:44', 8),
                              SalesData('15:03:46', 0),
                              SalesData('15:03:48', 31),
                              SalesData('15:03:50', 10),
                              SalesData('15:03:52', 35),
                              SalesData('15:03:54', 0),
                              SalesData('15:03:56', 0),
                              SalesData('15:03:58', 2),
                              SalesData('15:04:00', 4),
                              SalesData('15:04:32', 8),
                              SalesData('15:04:34', 3),
                              SalesData('15:04:36', 8),
                              SalesData('15:04:38', 5),
                              SalesData('15:04:40', 2),
                              SalesData('15:04:42', 0),
                              SalesData('15:04:44', 8),
                              SalesData('15:04:46', 0),
                              SalesData('15:04:48', 31),
                              SalesData('15:04:50', 10),
                              SalesData('15:05:46', 0),
                              SalesData('15:05:48', 32),
                              SalesData('15:05:50', 0),
                              SalesData('15:05:52', 35),
                              SalesData('15:05:54', 28),
                              SalesData('15:05:56', 34),
                              SalesData('15:05:58', 32),
                              SalesData('15:06:00', 66),
                              SalesData('15:06:22', 35),
                              SalesData('15:06:24', 0),
                              SalesData('15:06:26', 0),
                              SalesData('15:06:28', 2),
                              SalesData('15:06:30', 4),
                              SalesData('15:06:32', 8),
                              SalesData('15:06:34', 3),
                              SalesData('15:06:36', 8),
                              SalesData('15:06:38', 5),
                              SalesData('15:06:40', 2),
                              SalesData('15:06:42', 0),
                              SalesData('15:06:44', 8),
                              SalesData('15:06:46', 0),
                              SalesData('15:06:48', 31),
                              SalesData('15:06:50', 10),
                              SalesData('15:06:52', 35),
                              SalesData('15:06:54', 0),
                              SalesData('15:06:56', 0),
                              SalesData('15:06:58', 2),
                              SalesData('15:07:00', 4),
                              SalesData('15:07:32', 8),
                              SalesData('15:07:34', 3),
                              SalesData('15:07:36', 8),
                              SalesData('15:07:38', 5),
                              SalesData('15:07:40', 2),
                              SalesData('15:07:42', 0),
                              SalesData('15:07:44', 8),
                              SalesData('15:07:46', 0),
                              SalesData('15:07:48', 31),
                              SalesData('15:07:50', 10)
                            ],
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            //dataLabelSettings:DataLabelSettings(isVisible : true)
                        )
                      ]
                  ) ,
                ),
              ),
              ResponsiveGridCol(
                lg: 14,
                child: Container(
                  height: 35,
                  width: 100,
                  //alignment: Alignment(0, 0),
                  //color: Colors.green,
                  child: RaisedButton(onPressed: (){
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),

            ]),

      ),

    );
  }

}

class SalesData{
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}