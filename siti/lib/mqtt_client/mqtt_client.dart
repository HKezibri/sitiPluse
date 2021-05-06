import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';

Future<MqttClient> connect() async {
  MqttServerClient client =
  MqttServerClient.withPort('144.91.113.92', 'flutter_client', 1883);
  client.logging(on: false);
  client.onConnected = onConnected;
  //client.onDisconnected = onDisconnected;
  //client.onUnsubscribed = onUnsubscribed;
  client.onSubscribed = onSubscribed;
  //client.onSubscribeFail = onSubscribeFail;
  //client.pongCallback = pong;

  final connMess = MqttConnectMessage()
      .withClientIdentifier("elaaroub")
      .authenticateAs("siti", "siti@2021")
      .keepAliveFor(21600)
      //.withWillTopic('F01/R01/M02/flow')
      //.withWillMessage('test')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMess;
  try {
    await client.connect();
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>>    connected :)');
  } catch (e) {
    print('Exception: $e');
    client.disconnect();
  }

  if (client.connectionStatus.state == MqttConnectionState.connected) {
    print('Client connected..');
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      final payload =
      MqttPublishPayload.bytesToStringAsString(message.payload.message);

      print('Received message:  --> $payload <--  from topic: ${c[0].topic} ');
    });
  /*
    client.published.listen((MqttPublishMessage message) {
      print('published');
      final payload =
      MqttPublishPayload.bytesToStringAsString(message.payload.message);
      print(
          'Published message: $payload to topic: ${message.variableHeader.topicName}');
    });
   */
  } else {
    print(
        'Connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }

  return client;
}

void onConnected() {
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

