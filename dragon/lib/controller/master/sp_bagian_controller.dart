import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_sp_bagian.dart';
import 'package:dragon/view/base_widget/toast.dart';

class SP_BagianController with ChangeNotifier {
  List data_spBagianList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_sp_bagian m_sp_bagian = model_sp_bagian();
  List<DropdownMenuItem<int>> dropdownLimit;
  int totalNotaTerima = 0;
  int offset = 0;
  int limit = 0;
  double pageCount = 1;
  int page_index = 0;

  ///paginate
  Future<void> initData() async {
    c_page.text = '1';
    limitPaging();
    await selectDataPaginate(false, '');

    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, String cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_spBagianList =
        await m_sp_bagian.data_sp_bagian_paginate(cari, offset, limit);
    var count = await m_sp_bagian.count_sp_bagian_Paginate(cari);
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

  /// paginate
  void selectData(String cari) async {
    offset = 0;
    page_index = 0;
    // await selectDataPaginate(true);
    data_spBagianList =
        await model_sp_bagian().data_sp_bagian_paginate(cari, offset, limit);
    var count = await m_sp_bagian.count_sp_bagian_Paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah bagian
  TextEditingController no_buktiController = TextEditingController();
  TextEditingController kodeController = TextEditingController();
  TextEditingController bagianController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController total_qtyController = TextEditingController();

  void resetField() {
    no_buktiController.clear();
    kodeController.clear();
    bagianController.clear();
    namaController.clear();
    total_qtyController.clear();
  }

  Future<bool> tambah_bagian() async {
    if (no_buktiController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['no_bukti'] = no_buktiController.text;
      data_insert['kode'] = kodeController.text;
      data_insert['bagian'] = bagianController.text;
      data_insert['nama'] = namaController.text;
      data_insert['total_qty'] = total_qtyController.text;
      await model_sp_bagian().insert_data_bagian(data_insert);
      Toast("Success !!", "Berhasil menambah bagian !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_bagian(var id) async {
    if (namaController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['no_bukti'] = no_buktiController.text;
      data_insert['kode'] = kodeController.text;
      data_insert['bagian'] = bagianController.text;
      data_insert['nama'] = namaController.text;
      data_insert['total_qty'] = total_qtyController.text;
      // print(data_insert);
      await model_sp_bagian().update_data_bagian_by_id(data_insert);
      Toast("Success !!", "Berhasil update bagian !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_bagian(var data) async {
    await model_sp_bagian().delete_bagian_byID(data['no_id'].toString());
    selectDataPaginate(false, '');
  }
}
