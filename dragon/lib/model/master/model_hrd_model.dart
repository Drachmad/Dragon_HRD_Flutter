import 'package:dragon/mysql/koneksi_mysql.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class model_hrd_model {
  static String table = 'hrd_model';
  static String table_detail = 'hrd_model';
  koneksi_mysql m_koneksi = koneksi_mysql();
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

  Future<List> insert_hrd_model(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_hrd_model"),
        body: {
          "model": data_insert['model'].toString(),
          "notes": data_insert['notes'].toString(),
          "dr": data_insert['dr'].toString()
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_hrd_model"),
          body: {
            "model": data_insert['model'].toString(),
            "kd_bag": data_detail[i]['kd_bag'].toString(),
            "nm_bag": data_detail[i]['nm_bag'].toString(),
            "proses": data_detail[i]['proses'].toString(),
            "urut_ke": data_detail[i]['urut_ke'].toString(),
            "kode": data_detail[i]['kode'].toString(),
            "item": data_detail[i]['item'].toString(),
            "des1": data_detail[i]['des1'].toString(),
            "upah": data_detail[i]['upah'].toString(),
            "dr": data_detail[i]['dr'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_hrd_model(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_id": data_insert['no_id'].toString(),
          "kolom": "no_id",
          "tabel": "hrd_modeld"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_hrd_model"),
        body: {
          "model": data_insert['model'].toString(),
          "notes": data_insert['notes'].toString()
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_hrd_model"),
          body: {
            "model": data_insert['model'].toString(),
            "kd_bag": data_insert['kd_bag'].toString(),
            "nm_bag": data_insert['nm_bag'].toString(),
            "proses": data_detail[i]['proses'].toString(),
            "urut_ke": data_detail[i]['urut_ke'].toString(),
            "kode": data_detail[i]['kode'].toString(),
            "item": data_detail[i]['item'].toString(),
            "des1": data_detail[i]['des1'].toString(),
            "upah": data_detail[i]['upah'].toString(),
            "dr": data_detail[i]['dr'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> get_model(
      String kode, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/check_no_bukti"),
      body: {"cari": kode, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT DETAIL
  Future<List> select_hrd_model_detail(
      String filter, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": filter, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    // print(results2);
    return results2['data'].toList();
  }

  Future<List> delete_hrd_model(String model) async {
    var konek = await m_koneksi.koneksi();
    var results1 =
        await konek.query("delete from $table where model = '$model';");
    var results2 =
        await konek.query("delete from $table_detail where model = '$model';");
    await konek.close();
    return results2.toList();
  }
}
