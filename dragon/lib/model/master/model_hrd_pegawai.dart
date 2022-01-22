import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_hrd_pegawai {
  String baseUrl = base_url;

  ///paginate
  Future count_hrd_pegawai_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_hrd_pegawai_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_hrd_pegawai_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hrd_pegawai_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_pegawai(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambah_hrd_pegawai"), body: {
      "no_id": data_insert['no_id'].toString(),
      "nik": data_insert['nik'],
      "nm_peg": data_insert['nm_peg'],
      "kd_bag": data_insert['kd_bag'],
      "nm_bag": data_insert['nm_bag'],
      "aktif": data_insert['aktif'],
      "jk": data_insert['jk'],
      "kpj": data_insert['kpj'],
      "bpjs": data_insert['bpjs'],
      "alamat": data_insert['alamat'],
      "kota": data_insert['kota'],
      "kab": data_insert['kab'],
      "pendidikan": data_insert['pendidikan'],
      "tgl_masuk": data_insert['tgl_masuk'],
      "dr": data_insert['dr'],
      "rec": data_insert['rec'],
      "pokok": data_insert['pokok'],
      "umakan": data_insert['umakan'],
      "tjabatan": data_insert['tjabatan'],
      "tperbulan": data_insert['tperbulan'],
      "tastek": data_insert['tastek'],
      "premi": data_insert['premi'],
      "lbl": data_insert['lbl'],
      "ulembur": data_insert['ulembur'],
      "gaji": data_insert['gaji'],
      "nett": data_insert['nett']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<bool> update_data_pegawai_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubah_hrd_pegawai"), body: {
      "no_id": data_insert['no_id'].toString(),
      "nik": data_insert['nik'],
      "nm_peg": data_insert['nm_peg'],
      "kd_bag": data_insert['kd_bag'],
      "nm_bag": data_insert['nm_bag'],
      "aktif": data_insert['aktif'],
      "jk": data_insert['jk'],
      "kpj": data_insert['kpj'],
      "bpjs": data_insert['bpjs'],
      "alamat": data_insert['alamat'],
      "kota": data_insert['kota'],
      "kab": data_insert['kab'],
      "pendidikan": data_insert['pendidikan'],
      "tgl_masuk": data_insert['tgl_masuk'],
      "dr": data_insert['dr'],
      "rec": data_insert['rec'],
      "pokok": data_insert['pokok'],
      "umakan": data_insert['umakan'],
      "tjabatan": data_insert['tjabatan'],
      "tperbulan": data_insert['tperbulan'],
      "tastek": data_insert['tastek'],
      "premi": data_insert['premi'],
      "lbl": data_insert['lbl'],
      "ulembur": data_insert['ulembur'],
      "gaji": data_insert['gaji'],
      "nett": data_insert['nett']
    });

    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_pegawai_byID(String no_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_hrd_pegawai"),
      body: {"no_id": no_id},
    );
  }
}
