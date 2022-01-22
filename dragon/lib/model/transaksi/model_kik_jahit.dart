import 'package:dragon/mysql/koneksi_mysql.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dragon/constants.dart';

class model_kik_jahit {
  static String table = 'hrd_absen';
  static String table_detail = 'hrd_absend';
  koneksi_mysql m_koneksi = koneksi_mysql();
  String baseUrl = base_url;

  ///paginate
  Future count_kik_jahit_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_kik_jahit_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_kik_jahit_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/kik_jahit_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  // ///SELECT HEADER
  // Future<List> select_kik_jahit(String cari) async {
  //   final response = await http.post(
  //     Uri.parse("${baseUrl}:3000/tampil_kik_jahit"),
  //     body: {"cari": cari},
  //   );
  //   var results2 = json.decode(response.body);
  //   return results2['data'].toList();
  // }

  Future<List> insert_kik_jahit(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_kik_jahit"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "notes": data_insert['notes'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kik_jahit"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "kd_bag": data_detail[i]['kd_bag'].toString(),
            "kd_peg": data_detail[i]['kd_peg'].toString(),
            "nm_peg": data_detail[i]['nm_peg'].toString(),
            "ptkp": data_detail[i]['ptkp'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "jam1": data_detail[i]['jam1'].toString(),
            "jam2": data_detail[i]['jam2'].toString(),
            "jam1rp": data_detail[i]['jam1rp'].toString(),
            "jam2rp": data_detail[i]['jam2rp'].toString(),
            "lain": data_detail[i]['lain'].toString(),
            "insentifbulanan": data_detail[i]['insentifbulanan'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_kik_jahit(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kolom": "no_bukti",
          "tabel": "hrd_absend"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_kik_jahit"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "notes": data_insert['notes'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kik_jahit"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "kd_bag": data_detail[i]['kd_bag'].toString(),
            "kd_peg": data_detail[i]['kd_peg'].toString(),
            "nm_peg": data_detail[i]['nm_peg'].toString(),
            "ptkp": data_detail[i]['ptkp'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "jam1": data_detail[i]['jam1'].toString(),
            "jam2": data_detail[i]['jam2'].toString(),
            "jam1rp": data_detail[i]['jam1rp'].toString(),
            "jam2rp": data_detail[i]['jam2rp'].toString(),
            "lain": data_detail[i]['lain'].toString(),
            "insentifbulanan": data_detail[i]['insentifbulanan'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> get_no_bukti(
      String kode, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/check_no_bukti"),
      body: {"cari": kode, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT DETAIL
  Future<List> select_kik_jahit_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> delete_kik_jahit(String no_bukti) async {
    var konek = await m_koneksi.koneksi();
    var results1 =
        await konek.query("delete from $table where no_bukti = '$no_bukti';");
    var results2 = await konek
        .query("delete from $table_detail where no_bukti = '$no_bukti';");
    await konek.close();
    return results2.toList();
  }
}
