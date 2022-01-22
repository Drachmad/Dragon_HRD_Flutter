import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_hrd_grup {
  String baseUrl = base_url;

  ///paginate
  Future count_hrd_grup_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_hrd_grup_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_hrd_grup_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hrd_grup_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_hrdgrup(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambah_hrd_grup"), body: {
      "kd_grup": data_insert['kd_grup'],
      "nm_grup": data_insert['nm_grup'],
      "acno": data_insert['acno']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_hrdgrup_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_hrd_grup"), body: {
      "no_id": data_insert['no_id'].toString(),
      "kd_grup": data_insert['kd_grup'],
      "nm_grup": data_insert['nm_grup'],
      "acno": data_insert['acno'],
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_hrdgrup_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_hrd_grup"),
      body: {"no_id": no_id},
    );
  }
}
