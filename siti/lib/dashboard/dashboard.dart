import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:responsive_grid/responsive_grid.dart';
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


class GaugeApp extends StatelessWidget {

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

    // topic 1
    final pay1 = Provider.of<MQTTManager1>(context);
    var pyloadToDouble = double.parse(pay1.getPaload());
    pay1.connectMQTT();
    pay1.second();

    //topic 2
    final pay2 = Provider.of<MQTTManager2>(context);
    var pyloadToDouble2 = double.parse(pay2.getPaload());
    pay2.connectMQTT();
    pay2.second();

    //topic 3
    final pay3 = Provider.of<MQTTManager3>(context);
    var pyloadToDouble3 = double.parse(pay3.getPaload());
    pay3.connectMQTT();
    pay3.second();

    //topic 4
    final pay4 = Provider.of<MQTTManager4>(context);
    var pyloadToDouble4 = double.parse(pay4.getPaload());
    pay4.connectMQTT();
    pay4.second();

    //topic 5
    final pay5 = Provider.of<MQTTManager5>(context);
    var pyloadToDouble5 = double.parse(pay5.getPaload());
    pay5.connectMQTT();
    pay5.second();

    //topic 6
    final pay6 = Provider.of<MQTTManager6>(context);
    var pyloadToDouble6 = double.parse(pay6.getPaload());
    pay6.connectMQTT();
    pay6.second();

    //topic 7
    final pay7 = Provider.of<MQTTManager7>(context);
    var pyloadToDouble7 = double.parse(pay7.getPaload());
    pay7.connectMQTT();
    pay7.second();

    //topic 8
    final pay8 = Provider.of<MQTTManager8>(context);
    var pyloadToDouble8 = double.parse(pay8.getPaload());
    pay8.connectMQTT();
    pay8.second();

    //topic 9
    final pay9 = Provider.of<MQTTManager9>(context);
    var pyloadToDouble9 = double.parse(pay9.getPaload());
    pay9.connectMQTT();
    pay9.second();


    return Scaffold(

      body: ListView(children: <Widget>[

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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 01",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),


              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
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
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay1.payload.toString(), style:
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

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData1, String>(
                          dataSource: pay1.chartData,
                          xValueMapper: (SalesData1 sales, _) => sales.time,
                          yValueMapper: (SalesData1 sales, _) => sales.production,
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
                    pay1.reset();
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),
            ],
          ),
        ),


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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 02",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
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

                          NeedlePointer(value: pyloadToDouble2,
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
                          RangePointer(value: pyloadToDouble2,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay2.payload.toString(), style:
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

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData2, String>(
                          dataSource: pay2.chartData,
                          xValueMapper: (SalesData2 sales, _) => sales.time,
                          yValueMapper: (SalesData2 sales, _) => sales.production,
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
                    pay2.reset();
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),
            ],
          ),
        ),


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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 01",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
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

                          NeedlePointer(value: pyloadToDouble3,
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
                          RangePointer(value: pyloadToDouble3,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay3.payload.toString(), style:
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

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData3, String>(
                          dataSource: pay3.chartData,
                          xValueMapper: (SalesData3 sales, _) => sales.time,
                          yValueMapper: (SalesData3 sales, _) => sales.production,
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
                    pay3.reset();
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),
            ],
          ),
        ),


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
          color: Colors.blueAccent.withOpacity(0.8),
          spreadRadius: 2,
          blurRadius: 33,
          offset: Offset(0, 5), // changes position of shadow
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

              // color: Colors.deepOrange[300],
              child: Text("Machine 04",style: TextStyle(fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 22.0,
                    color: Colors.greenAccent,
                    offset: Offset(1.0, 5.0),
                  ),
                ],
              ))),
        ),

        ResponsiveGridCol(
          xs: 6,
          md: 3,
          child: Container(
            height: 64.9,
            alignment: Alignment(0, 0),
            //color: Colors.green,

            child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  fontFamily: 'RobotoMono',
                  fontStyle: FontStyle.italic,

                )),
          ),
        ),
        ResponsiveGridCol(
          xs: 6,
          md: 3,
          child: Container(
            height: 64.9,
            alignment: Alignment(0, 0),
            //color: Colors.green,

            child: Text("Total time :  21 min",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                )),
          ),

        ),
        ResponsiveGridCol(
          lg: 12,
          child: Container(
            height: 193,
            alignment: Alignment(0, 0),
            //color: Colors.purple,
            child: SfRadialGauge(

              axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                  interval: 10,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                  pointers: <GaugePointer>[

                    NeedlePointer(value: pyloadToDouble4,
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
                    RangePointer(value: pyloadToDouble4,
                        width: 30,
                        enableAnimation: true,
                        color: Colors.greenAccent)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                        widget: Text(pay4.payload.toString(), style:
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

                title: ChartTitle(text: 'Machine 4 Production Trafic', textStyle:
                TextStyle(
                  color: Colors.lightBlue[900],
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                )),

                primaryXAxis: CategoryAxis(),

                series: <ChartSeries>[
                  // Initialize line series
                  LineSeries<SalesData4, String>(
                    dataSource: pay4.chartData,
                    xValueMapper: (SalesData4 sales, _) => sales.time,
                    yValueMapper: (SalesData4 sales, _) => sales.production,
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
              pay4.reset();
            },

                color: Colors.greenAccent,
                child: Text("Reset",style: TextStyle(fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ))),
          ),
        ),
      ],
    ),
  ),


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
          color: Colors.blueAccent.withOpacity(0.8),
          spreadRadius: 2,
          blurRadius: 33,
          offset: Offset(0, 5), // changes position of shadow
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

              // color: Colors.deepOrange[300],
              child: Text("Machine 05",style: TextStyle(fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 22.0,
                    color: Colors.greenAccent,
                    offset: Offset(1.0, 5.0),
                  ),
                ],
              ))),
        ),

        ResponsiveGridCol(
          xs: 6,
          md: 3,
          child: Container(
            height: 64.9,
            alignment: Alignment(0, 0),
            //color: Colors.green,

            child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  fontFamily: 'RobotoMono',
                  fontStyle: FontStyle.italic,

                )),
          ),
        ),
        ResponsiveGridCol(
          xs: 6,
          md: 3,
          child: Container(
            height: 64.9,
            alignment: Alignment(0, 0),
            //color: Colors.green,

            child: Text("Total time :  21 min",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                )),
          ),

        ),
        ResponsiveGridCol(
          lg: 12,
          child: Container(
            height: 193,
            alignment: Alignment(0, 0),
            //color: Colors.purple,
            child: SfRadialGauge(

              axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                  interval: 10,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                  pointers: <GaugePointer>[

                    NeedlePointer(value: pyloadToDouble5,
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
                    RangePointer(value: pyloadToDouble5,
                        width: 30,
                        enableAnimation: true,
                        color: Colors.greenAccent)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                        widget: Text(pay5.payload.toString(), style:
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

                title: ChartTitle(text: 'Machine 5 Production Trafic', textStyle:
                TextStyle(
                  color: Colors.lightBlue[900],
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                )),

                primaryXAxis: CategoryAxis(),

                series: <ChartSeries>[
                  // Initialize line series
                  LineSeries<SalesData5, String>(
                    dataSource: pay5.chartData,
                    xValueMapper: (SalesData5 sales, _) => sales.time,
                    yValueMapper: (SalesData5 sales, _) => sales.production,
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
              pay5.reset();
            },

                color: Colors.greenAccent,
                child: Text("Reset",style: TextStyle(fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ))),
          ),
        ),
      ],
    ),
  ),


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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 06",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
                ),

              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 193,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: SfRadialGauge(

                    axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                        interval: 10,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                        pointers: <GaugePointer>[

                          NeedlePointer(value: pyloadToDouble6,
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
                          RangePointer(value: pyloadToDouble6,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay6.payload.toString(), style:
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

                      title: ChartTitle(text: 'Machine 6 Production Trafic', textStyle:
                      TextStyle(
                        color: Colors.lightBlue[900],
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      )),

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData6, String>(
                          dataSource: pay6.chartData,
                          xValueMapper: (SalesData6 sales, _) => sales.time,
                          yValueMapper: (SalesData6 sales, _) => sales.production,
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
                    pay6.reset();
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),
            ],
          ),
        ),

        // 7
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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 07",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
                ),

              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 193,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: SfRadialGauge(

                    axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                        interval: 10,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                        pointers: <GaugePointer>[

                          NeedlePointer(value: pyloadToDouble7,
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
                          RangePointer(value: pyloadToDouble7,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay7.payload.toString(), style:
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

                      title: ChartTitle(text: 'Machine 7 Production Trafic', textStyle:
                      TextStyle(
                        color: Colors.lightBlue[900],
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      )),

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData7, String>(
                          dataSource: pay7.chartData,
                          xValueMapper: (SalesData7 sales, _) => sales.time,
                          yValueMapper: (SalesData7 sales, _) => sales.production,
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
                    pay7.reset();
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),
            ],
          ),
        ),

        // 8
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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 08",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
                ),

              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 193,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: SfRadialGauge(

                    axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                        interval: 10,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                        pointers: <GaugePointer>[

                          NeedlePointer(value: pyloadToDouble8,
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
                          RangePointer(value: pyloadToDouble8,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay8.payload.toString(), style:
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

                      title: ChartTitle(text: 'Machine 8 Production Trafic', textStyle:
                      TextStyle(
                        color: Colors.lightBlue[900],
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      )),

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData8, String>(
                          dataSource: pay8.chartData,
                          xValueMapper: (SalesData8 sales, _) => sales.time,
                          yValueMapper: (SalesData8 sales, _) => sales.production,
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
                    pay8.reset();
                  },

                      color: Colors.greenAccent,
                      child: Text("Reset",style: TextStyle(fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ))),
                ),
              ),
            ],
          ),
        ),

        // 9
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
                color: Colors.blueAccent.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 33,
                offset: Offset(0, 5), // changes position of shadow
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

                    // color: Colors.deepOrange[300],
                    child: Text("Machine 09",style: TextStyle(fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 22.0,
                          color: Colors.greenAccent,
                          offset: Offset(1.0, 5.0),
                        ),
                      ],
                    ))),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrêts \t\t\t:\t 07",//${pay.breaks}
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.italic,

                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 64.9,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Total time :  21 min",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                      )),
                ),

              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 193,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: SfRadialGauge(

                    axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                        interval: 10,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                        pointers: <GaugePointer>[

                          NeedlePointer(value: pyloadToDouble9,
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
                          RangePointer(value: pyloadToDouble9,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.greenAccent)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text(pay9.payload.toString(), style:
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

                      title: ChartTitle(text: 'Machine 9 Production Trafic', textStyle:
                      TextStyle(
                        color: Colors.lightBlue[900],
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      )),

                      primaryXAxis: CategoryAxis(),

                      series: <ChartSeries>[
                        // Initialize line series
                        LineSeries<SalesData9, String>(
                          dataSource: pay9.chartData,
                          xValueMapper: (SalesData9 sales, _) => sales.time,
                          yValueMapper: (SalesData9 sales, _) => sales.production,
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
                    pay9.reset();
                  },

                      color: Colors.greenAccent,
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

