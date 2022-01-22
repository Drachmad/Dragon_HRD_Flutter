import 'dart:convert';

import 'package:flutter/services.dart';

class DataBarang {
  int id;
  String kode_barang;
  String nama_barang;
  String satuan;
  double stok;
  double harga_po;
  double harga_beli;
  double harga_jual;
  double stok_booking;

  DataBarang(
      {this.kode_barang,
      this.id,
      this.nama_barang,
      this.satuan,
      this.stok,
      this.harga_jual,
      this.harga_beli,
      this.harga_po,
      this.stok_booking});

  factory DataBarang.fromJson(var parsedJson) {
    return DataBarang(
        kode_barang: parsedJson['kode_barang'] as String,
        id: parsedJson['id'],
        nama_barang: parsedJson['nama_barang'] as String,
        satuan: parsedJson['satuan'] as String,
        stok: parsedJson['stok'],
        harga_beli: parsedJson['harga_beli'],
        harga_jual: parsedJson['harga_jual']);
  }
}

class BarangViewModel {
  static List<DataBarang> barangList;

  static Future loadBarang() async {
    try {
      barangList = new List<DataBarang>();
      String jsonString =
          await rootBundle.loadString('assets/file/barang.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['barang'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        barangList.add(new DataBarang.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
