import 'dart:convert';

import 'package:http/http.dart' as Http;

class NetworkService {
  static Future getStats(String s) async {
    Http.Response response = await Http.get(s);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print('nothing happened' + response.statusCode.toString() + s);
    }
  }
}
