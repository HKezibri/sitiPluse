import 'package:flutter/material.dart';
import 'package:siti/connexion_back_end/api.dart';
import 'package:siti/mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Connexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'siti - Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'siti Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MqttClient client;
  var topic4 = "F01/R01/M02/flow";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Connect'),
              onPressed: () => {
                connect().then((value) {
                  client = value;
                  //print("connected ===================");
                })
              },
            ),
            RaisedButton(
              child: Text('Subscribe'),
              onPressed: () async {

                var response = await http.get(Uri.http('192.168.0.178:5000', '/'));
                var decoded = convert.jsonDecode(response.body) as Map<String, dynamic>;
                var topics = decoded['topics'];

                print("==============================================>  $topic4");
                print("---------------------------------------------->   $topics");
                //return {client?.subscribe(topic4, MqttQos.atLeastOnce)};
                return {topics.forEach((e) => client?.subscribe(e, MqttQos.atLeastOnce))};
              },
            )
          ],
        ),
      ),
    );
  }
}





