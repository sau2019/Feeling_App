import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpServices {
  static String baseAPIurl = "https://www.qubehealth.com/qube_services/api/";

  Future<dynamic> getFeelingData({required String feelingDate}) async {
    try {
      var headers = {
        'X-Api-Key': 'f6d646a6c2f2df883ea0cccaa4097358ede98284',
        'Content-Type': 'application/json'
      };

      var response = await http.post(
          Uri.parse(baseAPIurl + "testservice/getListOfUserFeeling"),
          headers: headers,
          body: jsonEncode({
            'user_id': '3206161992',
            'feeling_date': feelingDate,
          }));

      var result = json.decode(response.body);
      return result;
    } catch (e) {
      return e.toString();
    }
  }
}
