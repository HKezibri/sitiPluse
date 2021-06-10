import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MQTTManager1 with ChangeNotifier {
  dynamic payload = "000";
  String isConnected = 'Non';
  String s = '';
  String topic = "F01/R01/M01";
  MqttServerClient client;


  void connectMQTT() async{
    this.client = MqttServerClient.withPort('144.91.113.92', 'flutter_client', 1883);
    MqttServerClient client =
    MqttServerClient.withPort('144.91.113.92', 'flutter_client', 1883);
    client.logging(on: false);
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;

    final connMess = MqttConnectMessage()
        .withClientIdentifier("siti")
        .authenticateAs("siti", "siti@2021")
        .keepAliveFor(21600)
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      await client.connect();
      client.subscribe("F01/R01/M01/flow", MqttQos.atLeastOnce);
    } catch (e) {
      print('Exception: ');
    }
    if (client.connectionStatus.state == MqttConnectionState.connected) {

      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage message = c[0].payload;
        this.payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        updateState();
      });
      isConnected = 'Oui';
    } else {
      print('Connection failed - disconnecting, ////////');
      isConnected = 'Non';
    }
  }




  void onSubscribed(String topic){
    client.subscribe(topic, MqttQos.atLeastOnce);
    print('subscribed to ==+>  $topic');
  }

  void onConnected(){
    client.onConnected();
    updateState();
  }


  void updateState() {
    notifyListeners();
  }

  String getPaload() => payload;


  List<SalesData1> chartData = [];
  void second() {
    var p = double.parse(this.payload);
    s = " " + DateTime.now().hour.toString() + ":"
        + DateTime.now().minute.toString() + ":"
        + DateTime.now().second.toString() + " ";

    chartData.add(
        SalesData1(s, p)
    );
    updateState();
  }

  void reset(){
    chartData.clear();
  }



  //List<Break> BreakInfo = [];
  void collectBreaks() {
    String dateD = '';
    String dateF = '';
    String totalTime = '';

    if (this.payload.toInt() <= 5){
        print('ok');
    }

  }

}


class SalesData1{
  SalesData1(this.time, this.production);
  final String time;
  final double production;
}

class Break{
  Break(this.topic, this.dateD, this.dateF, this.totalTime, this.cause);
  final  String dateD;
  final String dateF;
  final String totalTime;
  final String cause;
  final String topic;
}