import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_sp_barang {
  String baseUrl = base_url;

  ///paginate
  Future count_sp_barang_Paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_sp_barang_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_sp_barang_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/sp_barang_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_barang(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambah_sp_barang"), body: {
      "KD_BHN": data_insert['KD_BHN'],
      "NA_BHN": data_insert['NA_BHN'],
      "RAK": data_insert['RAK'],
      "AKTIF": data_insert['AKTIF'],
      "SATUAN": data_insert['SATUAN']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_barang_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_sp_barang"), body: {
      "NO_ID": data_insert['NO_ID'].toString(),
      "KD_BHN": data_insert['KD_BHN'],
      "NA_BHN": data_insert['NA_BHN'],
      "RAK": data_insert['RAK'],
      "AKTIF": data_insert['AKTIF'],
      "SATUAN": data_insert['SATUAN']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_barang_byID(String NO_ID) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_sp_barang"),
      body: {"NO_ID": NO_ID},
    );
  }
}
