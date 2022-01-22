import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_pembelian_supplier {
  String baseUrl = base_url;

  ///paginate
  Future count_pembelian_supplier_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_pembelian_supplier_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_pembelian_supplier_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/pembelian_supplier_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_pemsupplier(Map data_insert) async {
    final response = await http
        .post(Uri.parse("${baseUrl}:3000/tambah_pembelian_supplier"), body: {
      "KODES": data_insert['KODES'],
      "NAMAS": data_insert['NAMAS'],
      "KOTA": data_insert['KOTA']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_pemsupplier_by_id(Map data_insert) async {
    final response = await http
        .post(Uri.parse("${baseUrl}:3000/ubah_pembelian_supplier"), body: {
      "NO_ID": data_insert['NO_ID'].toString(),
      "KODES": data_insert['KODES'],
      "NAMAS": data_insert['NAMAS'],
      "KOTA": data_insert['KOTA'],
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_pemsupplier_byID(String NO_ID) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_pembelian_supplier"),
      body: {"NO_ID": NO_ID},
    );
  }
}
