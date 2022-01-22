import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_sp_barang.dart';
import 'package:dragon/view/base_widget/toast.dart';

class SP_Barang_Controller with ChangeNotifier {
  List data_spBarangList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_sp_barang m_sp_bagian = model_sp_barang();
  List<DropdownMenuItem<int>> dropdownLimit;
  int totalNotaTerima = 0;
  int offset = 0;
  int limit = 50;
  double pageCount = 1;
  int page_index = 0;

  ///paginate
  Future<void> initData() async {
    c_page.text = '1';
    limitPaging();
    await selectDataPaginate(true, '');
    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, String cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_spBarangList =
        await m_sp_bagian.data_sp_barang_paginate(cari, offset, limit);
    var count = await m_sp_bagian.count_sp_barang_Paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  ///paginate
  void limitPaging() {
    dropdownLimit = [];
    dropdownLimit.add(DropdownMenuItem(
      child: Text('10'),
      value: 10,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('25'),
      value: 25,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('50'),
      value: 50,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('100'),
      value: 100,
    ));
    limit = dropdownLimit[0].value;
  }

  ///paginate
  void selectData(String cari) async {
    offset = 0;
    page_index = 0;
    // await selectDataPaginate(true);
    data_spBarangList =
        await model_sp_barang().data_sp_barang_paginate(cari, offset, limit);
    var count = await m_sp_bagian.count_sp_barang_Paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah bahan
  TextEditingController KD_BHNController = TextEditingController();
  TextEditingController NA_BHNController = TextEditingController();
  TextEditingController RAKController = TextEditingController();
  TextEditingController AKTIFController = TextEditingController();
  TextEditingController SATUANController = TextEditingController();

  void resetField() {
    KD_BHNController.clear();
    NA_BHNController.clear();
    RAKController.clear();
    AKTIFController.clear();
    SATUANController.clear();
  }

  Future<bool> tambah_barang() async {
    if (KD_BHNController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['NO_ID'] = null;
      data_insert['KD_BHN'] = KD_BHNController.text;
      data_insert['NA_BHN'] = NA_BHNController.text;
      data_insert['RAK'] = RAKController.text;
      data_insert['AKTIF'] = AKTIFController.text;
      data_insert['SATUAN'] = SATUANController.text;
      await model_sp_barang().insert_data_barang(data_insert);
      Toast("Success !!", "Berhasil menambah bahan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_barang(var NO_ID) async {
    if (KD_BHNController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['NO_ID'] = NO_ID;
      data_insert['KD_BHN'] = KD_BHNController.text;
      data_insert['NA_BHN'] = NA_BHNController.text;
      data_insert['RAK'] = RAKController.text;
      data_insert['AKTIF'] = AKTIFController.text;
      data_insert['SATUAN'] = SATUANController.text;
      // print(data_insert);
      await model_sp_barang().update_data_barang_by_id(data_insert);
      Toast("Success !!", "Berhasil update bahan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_barang(var data) async {
    await model_sp_barang().delete_barang_byID(data['NO_ID'].toString());
    initData();
  }
}
