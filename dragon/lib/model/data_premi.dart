import 'package:dragon/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataPremi {
  String baseUrl = base_url;
  String no_kik;
  String model;
  String item;
  String des1;
  int qty;
  dynamic upah;
  double jumlah;
  double org;
  double hr;

  DataPremi({
    this.no_kik,
    this.model,
    this.item,
    this.des1,
    this.qty,
    this.upah,
    this.jumlah,
    this.org,
    this.hr,
  });

  factory DataPremi.fromJson(var parsedJson) {
    return DataPremi(
      no_kik: parsedJson['no_kik'] as String ?? "",
      model: parsedJson['model'] as String ?? "",
      item: parsedJson['item'] as String ?? "",
      des1: parsedJson['des1'] as String ?? "",
      qty: parsedJson['qty'] ?? 0,
      upah: parsedJson['upah'] ?? 0,
      jumlah: parsedJson['jumlah'] ?? 0,
      org: parsedJson['org'] ?? 0.0,
      hr: parsedJson['hr'] ?? 0.0,
    );
  }

  Future<List> data_premi(String kik_grup) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/indeks_premi"),
      body: {"kik_grup": kik_grup},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}
