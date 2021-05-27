import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager with ChangeNotifier {
  dynamic payload = "00";
  int cpt = 0;
  //DateTime now  =  DateTime.now();
  String s = '';
  MqttServerClient client;


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
      print('Exception: $e');

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
      print(
          'Connection failed - disconnecting, ////////');
      //client.disconnect();

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
    s = DateTime.now().hour.toString() + ":"
      + DateTime.now().minute.toString() + ":"
      + DateTime.now().second.toString();
    chartData.add(
        SalesData(s, p)
    );
    updateState();

  }

}

class SalesData{
  SalesData(this.time, this.production);
  final String time;
  final double production;
}