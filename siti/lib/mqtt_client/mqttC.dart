import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class MQTTManager with ChangeNotifier {
  dynamic payload = "000";
  dynamic payload2 = "000";

  int breaks = 0;
  //DateTime now  =  DateTime.now();
  String s = '';

  MqttServerClient client;


  void connectMQTT2(topic) async{
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
      print('connected :)');
    } catch (e) {
      print('Exception: ');
    }
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('Client connected.-                    <--');
      client.subscribe(topic, MqttQos.atLeastOnce);
      print('ok >>>');
      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage message = c[0].payload;
        this.payload2 =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print("in mqtt manager 2  ===>   $payload2");
        updateState();
      });
    } else {
      print('Connection failed - disconnecting, ////////');
    }
  }

  void connectMQTT(topic) async{
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
      print('connected :)');
    } catch (e) {
      print('Exception: ');
    }
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('Client connected.-                    <--');
      client.subscribe(topic, MqttQos.atLeastOnce);
      print('ok >>>');
      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage message = c[0].payload;
        this.payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print("in mqtt manager  ===>   $payload");

        updateState();
      });

    } else {
      print('Connection failed - disconnecting, ////////');
    }
  }




  void onSubscribed(String topic){
    //_topic = topic;
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

  List<SalesData> chartData = [];
  void second() {
    var p = double.parse(this.payload);
    s = " " + DateTime.now().hour.toString() + ":"
      + DateTime.now().minute.toString() + ":"
      + DateTime.now().second.toString() + " ";

    chartData.add(
        SalesData(s, p)
    );
    updateState();
  }
  void reset(){
    chartData.clear();
  }

  void incrBreaks(String topic) async {

    var response = await http.get(Uri.http('192.168.0.178:5000', '/breaks'));
    var breaksAPI = jsonDecode(response.body) as Map<String, dynamic>;
    breaks =  breaksAPI[topic].length;
    //print('////////////////////////         $breaks');
  }

}




class SalesData{
  SalesData(this.time, this.production);
  final String time;
  final double production;
}