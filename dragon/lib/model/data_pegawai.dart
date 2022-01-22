import 'package:dragon/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class DataPegawai {
  String baseUrl = base_url;
  int noid;
  String kd_peg;
  String nm_peg;
  String ptkp;
  double hr;
  double jam1;
  double jam2;
  double jam1rp;
  double jam2rp;
  double lain;
  double insentifbulanan;
  double jumlah;

  DataPegawai({
    this.noid,
    this.kd_peg,
    this.nm_peg,
    this.ptkp,
    this.hr,
    this.jam1,
    this.jam2,
    this.jam1rp,
    this.jam2rp,
    this.lain,
    this.insentifbulanan,
    this.jumlah,
  });

  factory DataPegawai.fromJson(var parsedJson) {
    return DataPegawai(
      noid: parsedJson['no_id'],
      kd_peg: parsedJson['kd_peg'] as String,
      nm_peg: parsedJson['nm_peg'] as String,
      ptkp: parsedJson['ptkp'] as String ?? "",
      hr: parsedJson['hr'] ?? 0.00,
      jam1: parsedJson['jam1'] ?? 0.00,
      jam2: parsedJson['jam2'] ?? 0.00,
      jam1rp: parsedJson['jam1rp'] ?? 0.00,
      jam2rp: parsedJson['jam2rp'] ?? 0.00,
      lain: parsedJson['lain'] ?? 0.00,
      insentifbulanan: parsedJson['insentifbulanan'] ?? 0.00,
      jumlah: parsedJson['jumlah'] ?? 0.00,
    );
  }

  Future<List> data_pegawai() async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/indeks_pegawai"),
      // body: {"cari": ""},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}

// class PegawaiViewModel {
//   static List<DataPegawai> pegawaiList;

//   static Future loadPegawai() async {
//     try {
//       pegawaiList = List<DataPegawai>();
//       String jsonString =
//           await rootBundle.loadString('assets/file/pegawai.json');
//       Map parsedJson = json.decode(jsonString);
//       var categoryJson = parsedJson['pegawai'] as List;
//       for (int i = 0; i < categoryJson.length; i++) {
//         pegawaiList.add(DataPegawai.fromJson(categoryJson[i]));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
