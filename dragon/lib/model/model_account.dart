import 'package:dragon/mysql/koneksi_mysql.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dragon/constants.dart';

class model_account {
  static String table = 'account';
  koneksi_mysql m_koneksi = koneksi_mysql();
  String baseUrl = base_url;

  Future<List> data_account() async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/indeks_account"),
      // body: {"cari": ""},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> data_accountcari(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/tampilaccount"),
      body: {"cari": cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> cari_account(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/cariaccount"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_accpaginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/accpaginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///paginate
  Future countAccPaginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/countaccpaginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> data_modal_kas(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/modal_acc_kas"),
      body: {"cari": cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> data_modal_bank(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/modal_acc_bank"),
      body: {"cari": cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> insert_data_account(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/tambahaccount"), body: {
      "ACNO": data_insert['ACNO'],
      "NAMA": data_insert['NAMA'],
      "BNK": data_insert['BNK'],
    });
    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> get_data_account(String id) async {
    var konek = await m_koneksi.koneksi();
    var results2 =
        await konek.query("select * from $table where NO_ID = '$id';");
    await konek.close();
    return results2.toList();
  }

  Future<List> search_acno(String acno) async {
    var konek = await m_koneksi.koneksi();
    var results2 = await konek.query(
        "select * from $table where acno like '%$acno%' or nama like '%$acno%';");
    await konek.close();
    return results2.toList();
  }

  Future<bool> update_data_account_by_id(Map data_insert) async {
    final response =
        await http.post(Uri.parse("${baseUrl}:3000/ubahaccount"), body: {
      "NO_ID": data_insert['NO_ID'].toString(),
      "ACNO": data_insert['ACNO'],
      "NAMA": data_insert['NAMA'],
      "BNK": data_insert['BNK']
    });
    if (response.statusCode >= 200) {
      return true;
    }
    return false;
  }

  Future<List> delete_account_byID(String id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapusaccount"),
      body: {"NO_ID": id},
    );
  }
}
