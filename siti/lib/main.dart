import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {

  final response = await http.get(Uri.http('your addresse', '/'));

  final decoded = convert.jsonDecode(response.body) as Map<String, dynamic>;
  print("${decoded['status']} <==============");
}

