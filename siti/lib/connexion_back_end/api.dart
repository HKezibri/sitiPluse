import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class restApi
{
  dynamic response;
  dynamic decoded;
  FlaskApi() async {

    this.response = await http.get(Uri.http('192.168.0.178:5000', '/topics'));

    this.decoded = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print("${decoded['topics']} <==============");

    return this.decoded;
  }
  dynamic gettest() => this.decoded;
}
