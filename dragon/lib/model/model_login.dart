import 'package:dragon/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class model_login {
  String baseUrl = base_url;

  Future<List> select_data_login(String username, String password) async {
    // var konek = await m_koneksi.koneksi();
    // var results2 = await konek.query(
    //     "select * from $table where username = '$username' and password = md5('$password');");
    // await konek.close();
    // print(baseUrl);
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/login"),
      body: {"username": username, "password": password},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> data_account() async {
    // var konek = await m_koneksi.koneksi();
    // var results2 = await konek.query('select * from ' + table);
    // await konek.close();
    // return results2.toList();
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/indeks_account"),
      // body: {"cari": ""},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}
