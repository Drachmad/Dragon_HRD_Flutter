import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_hrd_bagian {
  String baseUrl = base_url;

  ///paginate
  Future count_hrd_bagian_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_hrd_bagian_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_hrd_bagian_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hrd_bagian_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_hrdbagian(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambah_hrd_bagian"), body: {
      "kd_bag": data_insert['kd_bag'],
      "nm_bag": data_insert['nm_bag'],
      "prefix": data_insert['prefix'],
      "kd_kasi": data_insert['kd_kasi'],
      "nm_kasi": data_insert['nm_kasi'],
      "kd_grup": data_insert['kd_grup'],
      "nm_grup": data_insert['nm_grup'],
      "acno": data_insert['acno'],
      "dr": data_insert['dr']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_hrdbagian_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_hrd_bagian"), body: {
      "no_id": data_insert['no_id'].toString(),
      "kd_bag": data_insert['kd_bag'],
      "nm_bag": data_insert['nm_bag'],
      "prefix": data_insert['prefix'],
      "kd_kasi": data_insert['kd_kasi'],
      "nm_kasi": data_insert['nm_kasi'],
      "kd_grup": data_insert['kd_grup'],
      "nm_grup": data_insert['nm_grup'],
      "acno": data_insert['acno'],
      "dr": data_insert['dr']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_hrdbagian_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_hrd_bagian"),
      body: {"no_id": no_id},
    );
  }
}
