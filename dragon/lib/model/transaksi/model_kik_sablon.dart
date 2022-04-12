import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dragon/constants.dart';

class model_kik_sablon {
  String baseUrl = base_url;

  ///paginate
  Future count_kik_sablon_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_kik_sablon_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_kik_sablon_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/kik_sablon_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> insert_kik_sablon(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_kik_sablon"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "per": data_insert['per'].toString(),
          "dr": data_insert['dr'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "flag": data_insert['flag'].toString(),
          "kik_grup": data_insert['kik_grup'].toString(),
          "tqty": data_insert['tqty'].toString(),
          "tjumlah": data_insert['tjumlah'].toString(),
          "t_hr": data_insert['t_hr'].toString(),
          "notes": data_insert['notes'].toString(),
          "periode": data_insert['periode'].toString(),
          "ppn": data_insert['ppn'].toString(),
          "minuss": data_insert['minuss'].toString(),
          "lunas_bs": data_insert['lunas_bs'].toString(),
          "upah_tambah": data_insert['upah_tambah'].toString(),
          "pot_bon": data_insert['pot_bon'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kik_sablon"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "no_kik": data_detail[i]['no_kik'].toString(),
            "tgl_kik": data_detail[i]['tgl_kik'].toString(),
            "model": data_detail[i]['model'].toString(),
            "item": data_detail[i]['item'].toString(),
            "des1": data_detail[i]['des1'].toString(),
            "qty": data_detail[i]['qty'].toString(),
            "upah": data_detail[i]['upah'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
            "org": data_detail[i]['org'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "dr": data_detail[i]['dr'].toString(),
            "per": data_detail[i]['per'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_kik_sablon(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kolom": "no_bukti",
          "tabel": "hrd_kikd"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_kik_sablon"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "kik_grup": data_insert['kik_grup'].toString(),
          "notes": data_insert['notes'].toString(),
          "periode": data_insert['periode'].toString(),
          "ppn": data_insert['ppn'].toString(),
          "minuss": data_insert['minuss'].toString(),
          "lunas_bs": data_insert['lunas_bs'].toString(),
          "upah_tambah": data_insert['upah_tambah'].toString(),
          "pot_bon": data_insert['pot_bon'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kik_sablon"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "no_kik": data_detail[i]['no_kik'].toString(),
            "tgl_kik": data_detail[i]['tgl_kik'].toString(),
            "model": data_detail[i]['model'].toString(),
            "item": data_detail[i]['item'].toString(),
            "des1": data_detail[i]['des1'].toString(),
            "qty": data_detail[i]['qty'].toString(),
            "upah": data_detail[i]['upah'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
            "org": data_detail[i]['org'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "dr": data_detail[i]['dr'].toString(),
            "per": data_detail[i]['per'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> urut_nobukti(String per) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/urut_nobukti_kik_sablon"),
      body: {"per": per},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
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
  Future<List> select_kik_sablon_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future delete_kik_sablon(String no_bukti) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_kik_sablon"),
        body: {"tabel": "hrd_kik", "no_bukti": no_bukti},
      );
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_kik_sablon"),
        body: {"tabel": "hrd_kikd", "no_bukti": no_bukti},
      );
    } catch (e) {
      return false;
    }
  }
}
