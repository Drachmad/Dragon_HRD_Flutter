import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dragon/constants.dart';

class model_sp_bagian {
  String baseUrl = base_url;

  ///paginate
  Future count_sp_bagian_Paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_sp_bagian_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_sp_bagian_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/sp_bagian_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_bagian(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambah_sp_bagian"), body: {
      "no_bukti": data_insert['no_bukti'],
      "kode": data_insert['kode'],
      "bagian": data_insert['bagian'],
      "nama": data_insert['nama'],
      "total_qty": data_insert['total_qty']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_bagian_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_sp_bagian"), body: {
      "no_id": data_insert['no_id'].toString(),
      "no_bukti": data_insert['no_bukti'],
      "kode": data_insert['kode'],
      "bagian": data_insert['bagian'],
      "nama": data_insert['nama'],
      "total_qty": data_insert['total_qty']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_bagian_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_sp_bagian"),
      body: {"no_id": no_id},
    );
  }
}
