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
import 'package:siti/tableHome/table.dart';
import 'package:flutter/foundation.dart';
import 'package:siti/tableHome/ContactModel.dart';

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

  @override
  Widget build(BuildContext context) {

    var topic1 = "F01/R01/M01";
    final pay = Provider.of<MQTTManager>(context);
    var pyloadToDouble = double.parse(pay.getPaload());
    pay.connectMQTT(topic1 + "/flow");
    pay.incrBreaks(topic1);


    pay.second();
    return Scaffold(

      body: ListView(children: <Widget>[
        //MediaQuery.removePadding(context: context, child: ),
        Padding(padding: EdgeInsets.zero,),
              Container(
                //margin: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 0.0, bottom: 12.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3)
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 33,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),

                child: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      lg: 14,
                      child: Container(
                          height: 25,
                          width: 100,
                          alignment: Alignment(0, 0),
                          //color: Colors.green,
                          /* child: RaisedButton(onPressed: (){
                    pay.reset();
                  },*/

                          // color: Colors.deepOrange[300],
                          child: Text("Machine 01",style: TextStyle(fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ))),
                    ),


                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 64.9,
                        alignment: Alignment(0, 0),
                        //color: Colors.green,

                        child: Text("Arrets \t \r\r\r\r :\t ${pay.breaks}  \nTotal time :  0 min",
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
                              color: Colors.deepOrange[300],

                              child: Text("Justifier ?",style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
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
                              color: Colors.lightBlue[900],
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                            )),

                            // Initialize category axis
                            primaryXAxis: CategoryAxis(),

                            series: <ChartSeries>[
                              // Initialize line series
                              LineSeries<SalesData, String>(
                                dataSource: pay.chartData,
                                xValueMapper: (SalesData sales, _) => sales.time,
                                yValueMapper: (SalesData sales, _) => sales.production,
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
                          pay.reset();
                        },

                            color: Colors.deepOrange[300],
                            child: Text("Reset",style: TextStyle(fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            ))),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 0.0, bottom: 12.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3)
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 33,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),

                child: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      lg: 14,
                      child: Container(
                          height: 25,
                          width: 100,
                          alignment: Alignment(0, 0),
                          //color: Colors.green,
                          /* child: RaisedButton(onPressed: (){
                    pay.reset();
                  },*/

                          // color: Colors.deepOrange[300],
                          child: Text("Machine 02",style: TextStyle(fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ))),
                    ),


                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 64.9,
                        alignment: Alignment(0, 0),
                        //color: Colors.green,

                        child: Text("Arrets \t \r\r\r\r :\t ${pay.breaks}  \nTotal time :  0 min",
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
                          alignment: Alignment(0.9, 0),

                          child: RaisedButton(onPressed: (){

                            print("-------------------------------------------- ok");

                          },

                              color: Colors.deepOrange[300],
                              child: Text("Justifier ?",style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
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
                              color: Colors.lightBlue[900],
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                            )),

                            // Initialize category axis
                            primaryXAxis: CategoryAxis(),

                            series: <ChartSeries>[
                              // Initialize line series
                              LineSeries<SalesData, String>(
                                dataSource: pay.chartData,
                                xValueMapper: (SalesData sales, _) => sales.time,
                                yValueMapper: (SalesData sales, _) => sales.production,
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
                          pay.reset();
                        },

                            color: Colors.deepOrange[300],
                            child: Text("Reset",style: TextStyle(fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            ))),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 0.0, bottom: 12.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3)
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 33,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),

                child: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      lg: 14,
                      child: Container(
                          height: 25,
                          width: 100,
                          alignment: Alignment(0, 0),
                          //color: Colors.green,
                          /* child: RaisedButton(onPressed: (){
                    pay.reset();
                  },*/

                          // color: Colors.deepOrange[300],
                          child: Text("Machine 03",style: TextStyle(fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ))),
                    ),


                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 64.9,
                        alignment: Alignment(0, 0),
                        //color: Colors.green,

                        child: Text("Arrets \t \r\r\r\r :\t ${pay.breaks}  \nTotal time :  0 min",
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
                              color: Colors.deepOrange[300],

                              child: Text("Justifier ?",style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
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
                              color: Colors.lightBlue[900],
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                            )),

                            // Initialize category axis
                            primaryXAxis: CategoryAxis(),

                            series: <ChartSeries>[
                              // Initialize line series
                              LineSeries<SalesData, String>(
                                dataSource: pay.chartData,
                                xValueMapper: (SalesData sales, _) => sales.time,
                                yValueMapper: (SalesData sales, _) => sales.production,
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
                          pay.reset();
                        },

                            color: Colors.deepOrange[300],
                            child: Text("Reset",style: TextStyle(fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            ))),
                      ),
                    ),
                  ],
                ),
              ),

            ]
          ),

      );


  }

}


/*
class SalesData{
  SalesData(this.time, this.production);
  final String time;
  final double production;
}
 */