import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_hrd_model {
  String baseUrl = base_url;

  ///paginate
  Future count_hrd_model_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_hrd_model_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_hrd_model_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hrd_model_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_hrdmodel(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambah_hrd_model"), body: {
      "model": data_insert['model'],
      "notes": data_insert['notes'],
      "dr": data_insert['dr']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_hrdmodel_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_hrd_model"), body: {
      "no_id": data_insert['no_id'].toString(),
      "model": data_insert['model'],
      "notes": data_insert['notes'],
      "dr": data_insert['dr'],
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_hrdmodel_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_hrd_model"),
      body: {"no_id": no_id},
    );
  }
}
