import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dragon/constants.dart';

class DataBagian {
  String baseUrl = base_url;
  int no_id;
  String kd_bag;
  String nm_bag;
  String proses;
  String urut_ke;
  String kode;
  String item;
  String des1;
  double upah;

  DataBagian({
    this.no_id,
    this.kd_bag,
    this.nm_bag,
    this.proses,
    this.urut_ke,
    this.kode,
    this.item,
    this.des1,
    this.upah,
  });

  factory DataBagian.fromJson(var parsedJson) {
    return DataBagian(
        no_id: parsedJson['no_id'],
        kd_bag: parsedJson['kd_bag'] as String,
        nm_bag: parsedJson['nm_bag'] as String,
        proses: parsedJson['proses'] as String,
        urut_ke: parsedJson['urut_ke'] as String,
        kode: parsedJson['kode'] as String,
        item: parsedJson['item'] as String,
        des1: parsedJson['des1'] as String,
        upah: parsedJson['upah'] ?? 0.00);
  }

  Future<List> data_bagian(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/data_bagian"),
      body: {
        "cari": cari,
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}
