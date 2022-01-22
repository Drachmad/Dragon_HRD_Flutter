import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_hrd_borongan {
  String baseUrl = base_url;

  ///paginate
  Future count_hrd_borongan_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_hrd_borongan_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_hrd_borongan_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hrd_borongan_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_hrdborongan(Map data_insert) async {
    final response = await http
        .post(Uri.parse("${baseUrl}:3000/tambah_hrd_borongan"), body: {
      "kd_bag": data_insert['kd_bag'],
      "nm_bag": data_insert['nm_bag'],
      "stat": data_insert['stat'],
      "pk": data_insert['pk'],
      "pkph": data_insert['pkph'],
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_hrdborongan_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_hrd_borongan"), body: {
      "no_id": data_insert['no_id'].toString(),
      "kd_bag": data_insert['kd_bag'],
      "nm_bag": data_insert['nm_bag'],
      "stat": data_insert['stat'],
      "pk": data_insert['pk'],
      "pkph": data_insert['pkph'],
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_hrdborongan_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_hrd_borongan"),
      body: {"no_id": no_id},
    );
  }
}
