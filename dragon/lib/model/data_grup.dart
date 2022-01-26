import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_data_grup {
  String baseUrl = base_url;

  Future<List> data_grup(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/data_grup"),
      body: {
        "cari": cari,
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}
