import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';
import 'package:flutter/material.dart';

Future<MqttClient> connect() async {
  var payload;
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
    print('Client connected.*************************************.');
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      payload =
      MqttPublishPayload.bytesToStringAsString(message.payload.message);
      print(payload);

    });

  } else {
    print(
        'Connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }

  return client;
}

void onConnected() {
  //var topic = "F01/R01/M06/flow";
  //print(client?.subscribe(topic, MqttQos.atLeastOnce));
  print('Connected');
}
void onSubscribed(String topic) {
  print('Subscribed topic: $topic');
}
/*
void onDisconnected() {
  print('Disconnected');
}



void onSubscribeFail(String topic) {
  print('Failed to subscribe topic: $topic');
}

void onUnsubscribed(String topic) {
  print('Unsubscribed topic: $topic');
}
*/
//void pong() {
//  print('Ping response client callback invoked');
//}

