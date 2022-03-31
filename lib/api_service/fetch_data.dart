import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:invis_project/data_model/data_model.dart';

class ApiService {
  static Future<List<DataModel>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://invishost.in/api/list.php?lat=LATITUDE&lon=LONGITUDE'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((data) => DataModel.fromJson(data)).toList();
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
