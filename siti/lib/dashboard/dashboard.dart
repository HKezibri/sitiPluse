import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


/*  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        backgroundColor: Colors.white70,
        title: GaugeTitle(
            text: 'test',
            textStyle:
            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0,
              maximum: 100,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 35,
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 35,
                    endValue: 70,
                    color: Colors.orange,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 70,
                    endValue: 100,
                    color: Colors.red,
                    startWidth: 10,
                    endWidth: 10)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: 50)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: const Text('51.0',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }*/

  /*  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Siti')),
        body: _getGauge());
  }
}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SitiPlus Dashboard')),
      body: Container(


          child : Column(
            children: [

              Container(

                child : Padding(padding: EdgeInsets.all (5.0),
                    child : Column(
                      children: [
                        Container(

                            child : Text("Machine 01",style: TextStyle(fontSize: 25.0),)
                        ),
                        Container(
                            child : Row(
                              children: [
                                Container(
                                    child: RaisedButton(onPressed: (){},color: Colors.green,
                                        child: Text("Click here "))
                                ),

                              ],
                            )
                        ),
                        /*Container(
                     height: 30,
                     color: Colors.blue,
                     child: Row(
                       children: [
                         Container(
                           width: 100,
                           height: 50,
                           color: Colors.black,
                         ),
                       Container(
                         width: 100,
                         height: 50,
                         color: Colors.yellow,)

                       ],
                     ),

                   ),*/

                        Container(
                          height: 250,
                          child:    SfRadialGauge(
                            /* title: GaugeTitle(
                      text: 'Machine 01',
                      textStyle:
                      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),*/

                            axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                                interval: 10,
                                canScaleToFit: true,
                                axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                                pointers: <GaugePointer>[
                                  NeedlePointer(value: 90,
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
                                  RangePointer(value: 90,
                                      width: 30,
                                      enableAnimation: true,
                                      color: Colors.deepOrange)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                                      widget: Text('90.0', style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))]
                            )
                            ],
                          ) ,

                        ),
                        Container(
                          width: 400,
                          height: 213.0,
                          child: SfCartesianChart(),
                        ),
                        Container(
                            height: 50,
                            width: 700,
                            child: RaisedButton(onPressed: (){},color: Colors.green,
                                child: Text("Reset",))

                        ),


                      ],
                    )),




              )],
          )

      ),
    );
  }

}