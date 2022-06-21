import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.30.10.37";

class API {
  static Future getLog() {
    var url = baseUrl + "/api/getlog";
    return http.get(Uri.parse(url));
  }
}
