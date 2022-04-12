import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dragon/constants.dart';

class model_borongan {
  String baseUrl = base_url;

  ///paginate
  Future count_borongan_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_borongan_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_borongan_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/borongan_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> insert_borongan(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_borongan"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "kd_grup": data_insert['kd_grup'].toString(),
          "flag": data_insert['flag'].toString(),
          "dr": data_insert['dr'].toString(),
          "per": data_insert['per'].toString(),
          "total_kik": data_insert['total_kik'].toString(),
          "lain": data_insert['lain'].toString(),
          "tot_bon": data_insert['tot_bon'].toString(),
          "other": data_insert['other'].toString(),
          "kik_net": data_insert['kik_net'].toString(),
          "tms": data_insert['tms'].toString(),
          "premi": data_insert['premi'].toString(),
          "notes": data_insert['notes'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_borongan"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "flag": data_insert['flag'].toString(),
            "dr": data_insert['dr'].toString(),
            "per": data_insert['per'].toString(),
            "nm_bag": data_insert['nm_bag'].toString(),
            "kd_bag": data_insert['kd_bag'].toString(),
            "kd_peg": data_detail[i]['kd_peg'].toString(),
            "nm_peg": data_detail[i]['nm_peg'].toString(),
            "ptkp": data_detail[i]['ptkp'].toString(),
            "st": data_detail[i]['st'].toString(),
            "ms": data_detail[i]['ms'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "ik": data_detail[i]['ik'].toString(),
            "nb": data_detail[i]['nb'].toString(),
            "upah": data_detail[i]['upah'].toString(),
            "bon": data_detail[i]['bon'].toString(),
            "subsidi": data_detail[i]['subsidi'].toString(),
            "sub": data_detail[i]['sub'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_borongan(Map data_insert) async {
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
        Uri.parse("${baseUrl}:3000/edit_header_borongan"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "kd_grup": data_insert['kd_grup'].toString(),
          "total_kik": data_insert['total_kik'].toString(),
          "lain": data_insert['lain'].toString(),
          "tot_bon": data_insert['tot_bon'].toString(),
          "other": data_insert['other'].toString(),
          "kik_net": data_insert['kik_net'].toString(),
          "tms": data_insert['tms'].toString(),
          "premi": data_insert['premi'].toString(),
          "notes": data_insert['notes'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_borongan"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "flag": data_insert['flag'].toString(),
            "dr": data_insert['dr'].toString(),
            "per": data_insert['per'].toString(),
            "kd_bag": data_insert['kd_bag'].toString(),
            "nm_bag": data_insert['nm_bag'].toString(),
            "kd_peg": data_detail[i]['kd_peg'].toString(),
            "nm_peg": data_detail[i]['nm_peg'].toString(),
            "ptkp": data_detail[i]['ptkp'].toString(),
            "st": data_detail[i]['st'].toString(),
            "ms": data_detail[i]['ms'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "ik": data_detail[i]['ik'].toString(),
            "nb": data_detail[i]['nb'].toString(),
            "upah": data_detail[i]['upah'].toString(),
            "bon": data_detail[i]['bon'].toString(),
            "subsidi": data_detail[i]['subsidi'].toString(),
            "sub": data_detail[i]['sub'].toString(),
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
  Future<List> select_borongan_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future delete_borongan(String no_bukti) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_borongan"),
        body: {"tabel": "hrd_absen", "no_bukti": no_bukti},
      );
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_borongan"),
        body: {"tabel": "hrd_absend", "no_bukti": no_bukti},
      );
    } catch (e) {
      return false;
    }
  }
}
