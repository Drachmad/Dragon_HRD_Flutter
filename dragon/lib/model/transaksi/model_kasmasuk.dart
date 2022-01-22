import 'package:dragon/mysql/koneksi_mysql.dart';
import 'package:dragon/controller/login_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dragon/constants.dart';

class model_kasmasuk {
  static String table = 'kas';
  static String table_detail = 'kasd';
  static String tipe = 'BKM';
  koneksi_mysql m_koneksi = koneksi_mysql();
  String baseUrl = base_url;

  Future<List> insert_kasmasuk(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_kas"),
        body: {
          "nobukti": data_insert['no_bukti'].toString(),
          "tgl": data_insert['tanggal'].toString(),
          "per": "01/2022",
          "tipe": "BKM",
          "ket": data_insert['keterangan'].toString(),
          "user": LoginController().nama_staff.toString(),
          "bacno": data_insert['bacno'].toString(),
          "bnama": data_insert['nama'].toString(),
          "jumlah": data_insert['sumjumlah'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kas"),
          body: {
            "rec": (i + 1).toString(),
            "nobukti": data_insert['no_bukti'].toString(),
            "per": "01/2022",
            "tipe": "BKM",
            "acno": data_detail[i]['acno'].toString(),
            "nacno": data_detail[i]['nacno'].toString(),
            "uraian": data_detail[i]['uraian'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_kasmasuk(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kolom": "NO_BUKTI",
          "tabel": "kasd"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_kas"),
        body: {
          "nobukti": data_insert['no_bukti'].toString(),
          "tgl": data_insert['tanggal'].toString(),
          "ket": data_insert['keterangan'].toString(),
          "user": LoginController().nama_staff.toString(),
          "bacno": data_insert['bacno'].toString(),
          "bnama": data_insert['nama'].toString(),
          "jumlah": data_insert['sumjumlah'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kas"),
          body: {
            "rec": (i + 1).toString(),
            "nobukti": data_insert['no_bukti'].toString(),
            "per": "01/2022",
            "tipe": "BKM",
            "acno": data_detail[i]['acno'].toString(),
            "nacno": data_detail[i]['nacno'].toString(),
            "uraian": data_detail[i]['uraian'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> countKasMasuk(String date) async {
    var konek = await m_koneksi.koneksi();
    var result = await konek
        .query("SELECT no_bukti FROM $table where TGL like '$date%';");
    await konek.close();
    return result.toList();
  }

  Future<List> get_no_bukti(
      String kode, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/check_nobukti"),
      body: {"cari": kode, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT HEADER
  Future<List> select_kasmasuk(
      String cari, String start_date, String end_date) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/tampil_kas_masuk"),
      body: {"cari": cari, "tglawal": start_date, "tglakhir": end_date},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT DETAIL
  Future<List> select_kasmasuk_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> delete_kasmasuk_header(String no_bukti) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_header_kas"),
      body: {"no_bukti": no_bukti},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> delete_kasmasuk_detail(String no_bukti) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_detail_kas"),
      body: {"no_bukti": no_bukti},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}
