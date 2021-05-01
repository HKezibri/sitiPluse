import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:siti/dashboard/dashboard.dart';

void main() {
  return runApp(GaugeApp());
}



/*
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {

  final response = await http.get(Uri.http('192.168.0.178:5000', '/'));

  final decoded = convert.jsonDecode(response.body) as Map<String, dynamic>;
  print("${decoded['status']} <==============");
}

 */

