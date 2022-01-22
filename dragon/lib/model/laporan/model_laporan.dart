import 'package:dragon/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class model_laporan {
  String baseUrl = base_url;

  //// LAPORAN ABSEN HARIAN ////
  Future<List> lap_absen_harian(String KD_BAG, String PER) async {
    var data_whr = {"KD_BAG": KD_BAG, "PER": PER};

    final response = await http.post(
      Uri.parse("${baseUrl}:3000/lap_absen_harian"),
      body: data_whr,
    );
    var results2 = json.decode(response.body);

    return results2['data'].toList();
  }

  //// LAPORAN ABSEN HARIAN ////
  Future<List> lap_absen_lemburan(String KD_BAG) async {
    var data_whr = {"KD_BAG": KD_BAG};

    final response = await http.post(
      Uri.parse("${baseUrl}:3000/lap_absen_lemburan"),
      body: data_whr,
    );
    var results2 = json.decode(response.body);

    return results2['data'].toList();
  }

  //// LAPORAN LEMBUR HARIAN ////
  Future<List> lap_lembur_harian(String KD_BAG, String TGL) async {
    var data_whr = {"KD_BAG": KD_BAG, "TGL": TGL};

    final response = await http.post(
      Uri.parse("${baseUrl}:3000/lap_lembur_harian"),
      body: data_whr,
    );
    var results2 = json.decode(response.body);

    return results2['data'].toList();
  }

  Future<List> lap_lembur_borongan(String KD_BAG, String TGL) async {
    var data_whr = {"KD_BAG": KD_BAG, "TGL": TGL};

    final response = await http.post(
      Uri.parse("${baseUrl}:3000/lap_lembur_borongan"),
      body: data_whr,
    );
    var results2 = json.decode(response.body);

    return results2['data'].toList();
  }

  Future<List> lap_lembur_perjam(String KD_BAG, String TGL) async {
    var data_whr = {"KD_BAG": KD_BAG, "TGL": TGL};

    final response = await http.post(
      Uri.parse("${baseUrl}:3000/lap_lembur_perjam"),
      body: data_whr,
    );
    var results2 = json.decode(response.body);

    return results2['data'].toList();
  }
}
