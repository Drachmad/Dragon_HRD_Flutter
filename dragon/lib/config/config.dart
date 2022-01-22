import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class config {
  static const String nama_perusahaan = "PT. DRAGON SURYATAMA";

  final formatCurrency = new NumberFormat.simpleCurrency(
      locale: 'id_ID', name: 'Rp ', decimalDigits: 2);

  String format_rupiah(String uang_input) {
    try {
      String uang_rupiah = "0";
      double convert = convert_rupiah(uang_input);
      uang_rupiah = formatCurrency.format(convert).replaceAll(",00", "");
      return uang_rupiah;
    } catch (e) {
      return '';
      print(e);
    }
  }

  double convert_rupiah(String uang_input) {
    if (uang_input.toLowerCase().contains("rp")) {
      try {
        uang_input = formatCurrency.parse(uang_input).toString();
      } catch (e) {
        uang_input.replaceAll(
            uang_input.substring(uang_input.length - 1), ".0");
      }
    } else {
      if (uang_input.contains(".0")) {
        if (uang_input.substring(uang_input.length - 2, uang_input.length) ==
            ".0") {
          uang_input = uang_input.replaceAll(".0", "");
        }
      }
    }
    var jumlah_uang = double.tryParse('$uang_input') ?? 0;
    assert(jumlah_uang is double);
    return jumlah_uang;
  }

  String validateDouble(String value) {
    // Pattern pattern = r'^[\\./0-9]{0,50}$';
    RegExp regex = RegExp(r'^[\\./0-9]{0,50}$');
    if (!regex.hasMatch(value)) {
      return 'Format angka tidak valid';
    } else {
      return '';
    }
  }

  Future<void> createExcel(List header, List isi_excel, String judul) async {
    try {
      final Workbook workbook = Workbook();
      final Worksheet sheet = workbook.worksheets[0];
      sheet.showGridlines = true;

      sheet.enableSheetCalculations();

      sheet.getRangeByName('A1').columnWidth = 16.82;
      sheet.getRangeByName('B1').columnWidth = 18.82;
      sheet.getRangeByName('C1').columnWidth = 13.82;
      sheet.getRangeByName('D1').columnWidth = 13.20;
      sheet.getRangeByName('E1').columnWidth = 13.20;
      sheet.getRangeByName('F1').columnWidth = 10.73;
      sheet.getRangeByName('G1').columnWidth = 10.82;
      sheet.getRangeByName('H1').columnWidth = 10.46;
      sheet.getRangeByName('I1').columnWidth = 15.46;
      sheet.getRangeByName('J1').columnWidth = 15.46;
      sheet.getRangeByName('K1').columnWidth = 20.46;
      sheet.getRangeByName('L1').columnWidth = 10.46;

      sheet.getRangeByName('A1').setText(judul);
      sheet.getRangeByName('A1').cellStyle.fontSize = 14;

      int col = 1;
      for (int i = 0; i < header.length; i++) {
        sheet.getRangeByIndex(2, col + i).setText(header[i]);
        sheet.getRangeByIndex(2, col + i).cellStyle.bold = true;
        sheet.getRangeByIndex(2, col + i).cellStyle.fontSize = 12;
        sheet.getRangeByIndex(2, col + i).cellStyle.hAlign = HAlignType.center;
        sheet.getRangeByIndex(2, col + i).cellStyle.backColorRgb = HijauColor;
        sheet.getRangeByIndex(2, col + i).cellStyle.fontColorRgb = Colors.white;
      }
      int row = 3;
      for (int i = 0; i < isi_excel.length; i++) {
        Map<String, dynamic> isi_map = isi_excel[i];
        int coll = 1;
        isi_map.forEach((key, value) {
          if (validateDouble(isi_map[key.toString()].toString()) == null) {
            if (coll > 1) {
              sheet.getRangeByIndex(row + i, coll).setNumber(
                  double.tryParse(isi_map[key.toString()].toString()));
            } else {
              sheet
                  .getRangeByIndex(row + i, coll)
                  .setText(isi_map[key.toString()]);
            }
          } else {
            sheet
                .getRangeByIndex(row + i, coll)
                .setText(isi_map[key.toString()]);
          }
          sheet.getRangeByIndex(row, coll).cellStyle.bold = false;
          sheet.getRangeByIndex(row, coll).cellStyle.fontSize = 10;
          coll++;
        });
      }

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final Directory directory =
          await path_provider.getApplicationDocumentsDirectory();
      final String path = directory.path;
      final File file = File('$path/$judul.xlsx');
      await file.writeAsBytes(bytes);
      BotToast.closeAllLoading();
      await open_file.OpenFile.open('$path/$judul.xlsx');
    } catch (e) {
      BotToast.closeAllLoading();
      Toast("Error", e.toString(), false);
    }
  }

  Future<void> createExcel2(List header, List header_barang, List isi_transaksi,
      List isi_barang, List footer, String judul) async {
    try {
      final Workbook workbook = Workbook();
      final Worksheet sheet = workbook.worksheets[0];
      sheet.showGridlines = true;

      sheet.enableSheetCalculations();

      sheet.getRangeByName('A1').columnWidth = 16.82;
      sheet.getRangeByName('B1').columnWidth = 18.82;
      sheet.getRangeByName('C1').columnWidth = 13.82;
      sheet.getRangeByName('D1').columnWidth = 13.20;
      sheet.getRangeByName('E1').columnWidth = 13.20;
      sheet.getRangeByName('F1').columnWidth = 10.73;
      sheet.getRangeByName('G1').columnWidth = 10.82;
      sheet.getRangeByName('H1').columnWidth = 10.46;
      sheet.getRangeByName('I1').columnWidth = 15.46;
      sheet.getRangeByName('J1').columnWidth = 15.46;
      sheet.getRangeByName('K1').columnWidth = 20.46;
      sheet.getRangeByName('L1').columnWidth = 10.46;

      sheet.getRangeByName('A1').setText(judul);
      sheet.getRangeByName('A1').cellStyle.fontSize = 14;

      int col = 1;
      for (int i = 0; i < header.length; i++) {
        sheet.getRangeByIndex(2, col + i).setText(header[i]);
        sheet.getRangeByIndex(2, col + i).cellStyle.bold = true;
        sheet.getRangeByIndex(2, col + i).cellStyle.fontSize = 12;
        sheet.getRangeByIndex(2, col + i).cellStyle.hAlign = HAlignType.center;
        sheet.getRangeByIndex(2, col + i).cellStyle.backColorRgb = HijauColor;
        sheet.getRangeByIndex(2, col + i).cellStyle.fontColorRgb = Colors.white;
      }

      int coll = 1;
      for (int i = 0; i < header_barang.length; i++) {
        sheet.getRangeByIndex(4, coll + i).setText(header_barang[i]);
        sheet.getRangeByIndex(4, coll + i).cellStyle.bold = true;
        sheet.getRangeByIndex(4, coll + i).cellStyle.fontSize = 12;
        sheet.getRangeByIndex(4, coll + i).cellStyle.hAlign = HAlignType.center;
        sheet.getRangeByIndex(4, coll + i).cellStyle.backColorRgb = HijauColor;
        sheet.getRangeByIndex(4, coll + i).cellStyle.fontColorRgb =
            Colors.white;
      }
      int row = 3;
      for (int i = 0; i < isi_transaksi.length; i++) {
        Map<String, dynamic> isi_map = isi_transaksi[i];
        int coll = 1;
        isi_map.forEach((key, value) {
          if (validateDouble(isi_map[key.toString()].toString()) == null) {
            if (coll > 1) {
              sheet.getRangeByIndex(row + i, coll).setNumber(
                  double.tryParse(isi_map[key.toString()].toString()));
            } else {
              sheet
                  .getRangeByIndex(row + i, coll)
                  .setText(isi_map[key.toString()]);
            }
          } else {
            sheet
                .getRangeByIndex(row + i, coll)
                .setText(isi_map[key.toString()]);
          }
          sheet.getRangeByIndex(row, coll).cellStyle.bold = false;
          sheet.getRangeByIndex(row, coll).cellStyle.fontSize = 12;
          coll++;
        });
      }

      row = 5;
      for (int i = 0; i < isi_barang.length; i++) {
        Map<String, dynamic> isi_map = isi_barang[i];
        int coll = 1;
        isi_map.forEach((key, value) {
          if (validateDouble(isi_map[key.toString()].toString()) == null) {
            if (coll > 1) {
              sheet.getRangeByIndex(row + i, coll).setNumber(
                  double.tryParse(isi_map[key.toString()].toString()));
            } else {
              sheet
                  .getRangeByIndex(row + i, coll)
                  .setText(isi_map[key.toString()]);
            }
          } else {
            sheet
                .getRangeByIndex(row + i, coll)
                .setText(isi_map[key.toString()]);
          }
          sheet.getRangeByIndex(row, coll).cellStyle.bold = false;
          sheet.getRangeByIndex(row, coll).cellStyle.fontSize = 12;
          coll++;
        });
      }

      int col_footer = 5 + isi_barang.length;
      for (int i = 0; i < footer.length; i++) {
        if (footer[i].toString() != "" &&
            validateDouble(footer[i].toString()) == null) {
          sheet.getRangeByIndex(col_footer, 1 + i).setNumber(footer[i]);
          sheet.getRangeByIndex(col_footer, 1 + i).cellStyle.hAlign =
              HAlignType.right;
        } else {
          sheet.getRangeByIndex(col_footer, 1 + i).setText(footer[i]);
          sheet.getRangeByIndex(col_footer, 1 + i).cellStyle.hAlign =
              HAlignType.center;
        }
        sheet.getRangeByIndex(col_footer, 1 + i).cellStyle.bold = true;
        sheet.getRangeByIndex(col_footer, 1 + i).cellStyle.fontSize = 12;
        sheet.getRangeByIndex(col_footer, 1 + i).cellStyle.backColorRgb =
            GreyColor;
        sheet.getRangeByIndex(col_footer, 1 + i).cellStyle.fontColorRgb =
            Colors.white;
      }

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final Directory directory =
          await path_provider.getApplicationDocumentsDirectory();
      final String path = directory.path;
      final File file = File('$path/$judul.xlsx');
      await file.writeAsBytes(bytes);
      BotToast.closeAllLoading();
      await open_file.OpenFile.open('$path/$judul.xlsx');
    } catch (e) {
      BotToast.closeAllLoading();
      Toast("Error", e.toString(), false);
    }
  }

  Future<void> createExcel3(
      List header, List isi_excel, String header_title, String judul) async {
    try {
      final Workbook workbook = Workbook();
      final Worksheet sheet = workbook.worksheets[0];
      sheet.showGridlines = true;

      sheet.enableSheetCalculations();

      sheet.getRangeByName('A1').columnWidth = 16.82;
      sheet.getRangeByName('B1').columnWidth = 18.82;
      sheet.getRangeByName('C1').columnWidth = 13.82;
      sheet.getRangeByName('D1').columnWidth = 13.20;
      sheet.getRangeByName('E1').columnWidth = 13.20;
      sheet.getRangeByName('F1').columnWidth = 10.73;
      sheet.getRangeByName('G1').columnWidth = 10.82;
      sheet.getRangeByName('H1').columnWidth = 10.46;
      sheet.getRangeByName('I1').columnWidth = 15.46;
      sheet.getRangeByName('J1').columnWidth = 15.46;
      sheet.getRangeByName('K1').columnWidth = 20.46;
      sheet.getRangeByName('L1').columnWidth = 10.46;

      sheet.getRangeByName('A1').setText(header_title);
      sheet.getRangeByName('A1').cellStyle.fontSize = 14;

      int col = 1;
      for (int i = 0; i < header.length; i++) {
        sheet.getRangeByIndex(2, col + i).setText(header[i]);
        sheet.getRangeByIndex(2, col + i).cellStyle.bold = true;
        sheet.getRangeByIndex(2, col + i).cellStyle.fontSize = 12;
        sheet.getRangeByIndex(2, col + i).cellStyle.hAlign = HAlignType.center;
        sheet.getRangeByIndex(2, col + i).cellStyle.backColorRgb = HijauColor;
        sheet.getRangeByIndex(2, col + i).cellStyle.fontColorRgb = Colors.white;
      }
      int row = 3;
      for (int i = 0; i < isi_excel.length; i++) {
        Map<String, dynamic> isi_map = isi_excel[i];
        int coll = 1;
        isi_map.forEach((key, value) {
          if (validateDouble(isi_map[key.toString()].toString()) == null) {
            if (coll > 1) {
              sheet.getRangeByIndex(row + i, coll).setNumber(
                  double.tryParse(isi_map[key.toString()].toString()));
            } else {
              sheet
                  .getRangeByIndex(row + i, coll)
                  .setText(isi_map[key.toString()]);
            }
          } else {
            sheet
                .getRangeByIndex(row + i, coll)
                .setText(isi_map[key.toString()]);
          }
          sheet.getRangeByIndex(row, coll).cellStyle.bold = false;
          sheet.getRangeByIndex(row, coll).cellStyle.fontSize = 10;
          coll++;
        });
      }

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final Directory directory =
          await path_provider.getApplicationDocumentsDirectory();
      final String path = directory.path;
      final File file = File('$path/$judul.xlsx');
      await file.writeAsBytes(bytes);
      BotToast.closeAllLoading();
      await open_file.OpenFile.open('$path/$judul.xlsx');
    } catch (e) {
      BotToast.closeAllLoading();
      Toast("Error", e.toString(), false);
    }
  }
}
