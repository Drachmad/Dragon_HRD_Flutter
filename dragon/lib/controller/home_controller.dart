import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
// import 'package:dragon/model/model_order_pembelian.dart';
// import 'package:dragon/model/model_order_penjualan.dart';
// import 'package:dragon/model/model_pembelian.dart';
// import 'package:dragon/model/model_penjualan.dart';

class HomeController with ChangeNotifier {
  final format_created = new DateFormat("yyyy-MM", "id_ID");
  int trx_count = 0;

  int po_count = 0;
  int so_count = 0;
  int buy_count = 0;
  int sale_count = 0;

  double po_percent = 0;
  double so_percent = 0;
  double buy_percent = 0;
  double sale_percent = 0;

  //pemasukan
  double pemasukan_januari = 0;
  double pemasukan_februari = 0;
  double pemasukan_maret = 0;
  double pemasukan_april = 0;
  double pemasukan_mei = 0;
  double pemasukan_juni = 0;
  double pemasukan_juli = 0;
  double pemasukan_agustus = 0;
  double pemasukan_september = 0;
  double pemasukan_oktober = 0;
  double pemasukan_november = 0;
  double pemasukan_desember = 0;

  // pengeluaran
  double pengeluaran_januari = 0;
  double pengeluaran_februari = 0;
  double pengeluaran_maret = 0;
  double pengeluaran_april = 0;
  double pengeluaran_mei = 0;
  double pengeluaran_juni = 0;
  double pengeluaran_juli = 0;
  double pengeluaran_agustus = 0;
  double pengeluaran_september = 0;
  double pengeluaran_oktober = 0;
  double pengeluaran_november = 0;
  double pengeluaran_desember = 0;

/*
  void baca_allData(int mode) async {
    if (mode == 0 || mode == 1) {
      await model_order_pembelian()
          .countOrderPembelian(format_created.format(DateTime.now()))
          .then((value) {
        if (value != null) {
          po_count = value.length;
        } else {
          po_count = 0;
        }
      });
    }
    if (mode == 0 || mode == 2) {
      await model_order_penjualan()
          .countOrderPenjualan(format_created.format(DateTime.now()))
          .then((value) {
        if (value != null) {
          so_count = value.length;
        } else {
          so_count = 0;
        }
      });
    }
    if (mode == 0 || mode == 3) {
      await model_pembelian()
          .countPembelian(format_created.format(DateTime.now()))
          .then((value) {
        if (value != null) {
          buy_count = value.length;
        } else {
          buy_count = 0;
        }
      });
      await model_pembelian().sumPembelianPerbulan().then((value) {
        if (value != null) {
          if (value.containsKey(1)) {
            pengeluaran_januari = value[1];
          }
          if (value.containsKey(2)) {
            pengeluaran_februari = value[2];
          }
          if (value.containsKey(3)) {
            pengeluaran_maret = value[3];
          }
          if (value.containsKey(4)) {
            pengeluaran_april = value[4];
          }
          if (value.containsKey(5)) {
            pengeluaran_mei = value[5];
          }
          if (value.containsKey(6)) {
            pengeluaran_juni = value[6];
          }
          if (value.containsKey(7)) {
            pengeluaran_juli = value[7];
          }
          if (value.containsKey(8)) {
            pengeluaran_agustus = value[8];
          }
          if (value.containsKey(9)) {
            pengeluaran_september = value[9];
          }
          if (value.containsKey(10)) {
            pengeluaran_oktober = value[10];
          }
          if (value.containsKey(11)) {
            pengeluaran_november = value[11];
          }
          if (value.containsKey(12)) {
            pengeluaran_desember = value[12];
          }
        }
      });
    }
    if (mode == 0 || mode == 4) {
      await model_penjualan()
          .countPenjualan(format_created.format(DateTime.now()))
          .then((value) {
        if (value != null) {
          sale_count = value.length;
        } else {
          sale_count = 0;
        }
      });
      await model_penjualan().sumPenjualanPerbulan().then((value) {
        if (value != null) {
          if (value.containsKey(1)) {
            pemasukan_januari = value[1];
          }
          if (value.containsKey(2)) {
            pemasukan_februari = value[2];
          }
          if (value.containsKey(3)) {
            pemasukan_maret = value[3];
          }
          if (value.containsKey(4)) {
            pemasukan_april = value[4];
          }
          if (value.containsKey(5)) {
            pemasukan_mei = value[5];
          }
          if (value.containsKey(6)) {
            pemasukan_juni = value[6];
          }
          if (value.containsKey(7)) {
            pemasukan_juli = value[7];
          }
          if (value.containsKey(8)) {
            pemasukan_agustus = value[8];
          }
          if (value.containsKey(9)) {
            pemasukan_september = value[9];
          }
          if (value.containsKey(10)) {
            pemasukan_oktober = value[10];
          }
          if (value.containsKey(11)) {
            pemasukan_november = value[11];
          }
          if (value.containsKey(12)) {
            pemasukan_desember = value[12];
          }
        }
      });
    }

    trx_count = po_count + so_count + buy_count + sale_count;
    if (po_count > 0) {
      po_percent = (po_count / trx_count) * 100;
    } else {
      po_percent = 0;
    }
    if (so_count > 0) {
      so_percent = (so_count / trx_count) * 100;
    } else {
      so_percent = 0;
    }
    if (buy_count > 0) {
      buy_percent = (buy_count / trx_count) * 100;
    } else {
      buy_percent = 0;
    }
    if (sale_count > 0) {
      sale_percent = (sale_count / trx_count) * 100;
    } else {
      sale_percent = 0;
    }
    notifyListeners();
  }
  */
}
