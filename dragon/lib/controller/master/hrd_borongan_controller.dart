import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_hrd_borongan.dart';
import 'package:dragon/view/base_widget/toast.dart';

class HRD_BoronganController with ChangeNotifier {
  List data_hrdBoronganList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_hrd_borongan m_hrd_borongan = model_hrd_borongan();
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
    data_hrdBoronganList =
        await m_hrd_borongan.data_hrd_borongan_paginate(cari, offset, limit);
    var count = await m_hrd_borongan.count_hrd_borongan_paginate(cari);
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

  void selectData(String cari) async {
    offset = 0;
    page_index = 0;
    data_hrdBoronganList = await model_hrd_borongan()
        .data_hrd_borongan_paginate(cari, offset, limit);
    var count = await m_hrd_borongan.count_hrd_borongan_paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah hrdborongan
  TextEditingController kd_bagController = TextEditingController();
  TextEditingController nm_bagController = TextEditingController();
  TextEditingController statController = TextEditingController();
  TextEditingController pkController = TextEditingController();
  TextEditingController pkphController = TextEditingController();

  void resetField() {
    kd_bagController.clear();
    nm_bagController.clear();
    statController.clear();
    pkController.clear();
    pkphController.clear();
  }

  Future<bool> tambah_hrdborongan() async {
    if (kd_bagController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['kd_bag'] = kd_bagController.text;
      data_insert['nm_bag'] = nm_bagController.text;
      data_insert['stat'] = statController.text;
      data_insert['pk'] = pkController.text;
      data_insert['pkph'] = pkphController.text;
      await model_hrd_borongan().insert_data_hrdborongan(data_insert);
      Toast("Success !!", "Berhasil menambah HRD Borongan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_hrdborongan(var id) async {
    if (kd_bagController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['kd_bag'] = kd_bagController.text;
      data_insert['nm_bag'] = nm_bagController.text;
      data_insert['stat'] = statController.text;
      data_insert['pk'] = pkController.text;
      data_insert['pkph'] = pkphController.text;
      // print(data_insert);
      await model_hrd_borongan().update_data_hrdborongan_by_id(data_insert);
      Toast("Success !!", "Berhasil update HRD Borongan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_hrdborongan(var data) async {
    await model_hrd_borongan()
        .delete_hrdborongan_byID(data['no_id'].toString());
    initData();
  }
}
