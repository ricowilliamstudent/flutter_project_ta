import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.43.247";

class API {
  static Future getLog() {
    var url = baseUrl + "/api/getlog";
    return http.get(Uri.parse(url));
  }
}
