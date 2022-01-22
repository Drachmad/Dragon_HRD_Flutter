import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_sp_inventori {
  String baseUrl = base_url;

  ///paginate
  Future count_sp_inventori_Paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_sp_inventori_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_sp_inventori_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/sp_inventori_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_inventori(Map data_insert) async {
    final response = await http
        .post(Uri.parse("${baseUrl}:3000/tambah_sp_inventori"), body: {
      "no_bukti": data_insert['no_bukti'],
      "kode": data_insert['kode'],
      "nama": data_insert['nama'],
      "bagian": data_insert['bagian'],
      "j_barang": data_insert['j_barang'],
      "merk": data_insert['merk'],
      "tgl_ma": data_insert['tgl_ma'],
      "tgl_ke": data_insert['tgl_ke'],
      "tgl_mutasi": data_insert['tgl_mutasi'],
      "jumlah": data_insert['jumlah'],
      "satuan": data_insert['satuan'],
      "keter": data_insert['keter'],
      "tempat": data_insert['tempat'],
      "rec": data_insert['rec'],
      "kd_brg": data_insert['kd_brg']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_inventori_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_sp_inventori"), body: {
      "no_id": data_insert['no_id'].toString(),
      "no_bukti": data_insert['no_bukti'],
      "kode": data_insert['kode'],
      "nama": data_insert['nama'],
      "bagian": data_insert['bagian'],
      "j_barang": data_insert['j_barang'],
      "merk": data_insert['merk'],
      "tgl_ma": data_insert['tgl_ma'],
      "tgl_ke": data_insert['tgl_ke'],
      "tgl_mutasi": data_insert['tgl_mutasi'],
      "jumlah": data_insert['jumlah'],
      "satuan": data_insert['satuan'],
      "keter": data_insert['keter'],
      "tempat": data_insert['tempat'],
      "rec": data_insert['rec'],
      "kd_brg": data_insert['kd_brg']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_inventori_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_sp_inventori"),
      body: {"no_id": no_id},
    );
  }
}
