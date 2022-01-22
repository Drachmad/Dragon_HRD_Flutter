import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_hrd_bagian.dart';
import 'package:dragon/view/base_widget/toast.dart';

class HRD_BagianController with ChangeNotifier {
  List data_hrdBagianList = [];
  bool proses = false;

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController cari = TextEditingController();
  model_hrd_bagian m_hrdbagian = model_hrd_bagian();
  List<DropdownMenuItem<int>> dropdownLimit;
  int totalNotaTerima = 0;
  int offset = 0;
  int limit = 50;
  double pageCount = 1;
  int page_index = 0;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  Future<void> initData() async {
    c_page.text = '1';
    limitPaging();
    await selectDataPaginate(true, '');
    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_hrdBagianList =
        await m_hrdbagian.data_hrd_bagian_paginate(cari, offset, limit);
    var count = await m_hrdbagian.count_hrd_bagian_paginate(cari);
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

  // void selectData(String cari) async {
  //   offset = 0;
  //   page_index = 0;
  //   data_hrdBagianList =
  //       await model_hrd_bagian().data_hrd_bagian_paginate(cari, offset, limit);
  //   var count = await m_hrdbagian.count_hrd_bagian_paginate(cari);
  //   totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
  //   pageCount = totalNotaTerima / limit;
  //   notifyListeners();
  // }

  //variable tambah hrdbagian
  TextEditingController kd_bagController = TextEditingController();
  TextEditingController nm_bagController = TextEditingController();
  TextEditingController prefixController = TextEditingController();
  TextEditingController kd_kasiController = TextEditingController();
  TextEditingController nm_kasiController = TextEditingController();
  TextEditingController kd_grupController = TextEditingController();
  TextEditingController nm_grupController = TextEditingController();
  TextEditingController acnoController = TextEditingController();
  TextEditingController drController = TextEditingController();

  void resetField() {
    kd_bagController.clear();
    nm_bagController.clear();
    prefixController.clear();
    kd_kasiController.clear();
    nm_kasiController.clear();
    kd_grupController.clear();
    nm_grupController.clear();
    acnoController.clear();
    drController.clear();
  }

  Future<bool> tambah_hrdbagian() async {
    if (kd_bagController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['kd_bag'] = kd_bagController.text;
      data_insert['nm_bag'] = nm_bagController.text;
      data_insert['prefix'] = prefixController.text;
      data_insert['kd_kasi'] = kd_kasiController.text;
      data_insert['nm_kasi'] = nm_kasiController.text;
      data_insert['kd_grup'] = kd_grupController.text;
      data_insert['nm_grup'] = nm_grupController.text;
      data_insert['acno'] = acnoController.text;
      data_insert['dr'] = drController.text;
      await model_hrd_bagian().insert_data_hrdbagian(data_insert);
      Toast("Success !!", "Berhasil menambah HRD bagian !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_hrdbagian(var id) async {
    if (kd_bagController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['kd_bag'] = kd_bagController.text;
      data_insert['nm_bag'] = nm_bagController.text;
      data_insert['prefix'] = prefixController.text;
      data_insert['kd_kasi'] = kd_kasiController.text;
      data_insert['nm_kasi'] = nm_kasiController.text;
      data_insert['kd_grup'] = kd_grupController.text;
      data_insert['nm_grup'] = nm_grupController.text;
      data_insert['acno'] = acnoController.text;
      data_insert['dr'] = drController.text;
      // print(data_insert);
      await model_hrd_bagian().update_data_hrdbagian_by_id(data_insert);
      Toast("Success !!", "Berhasil update HRD bagian !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_hrdbagian(var data) async {
    await model_hrd_bagian().delete_hrdbagian_byID(data['no_id'].toString());
    selectDataPaginate(false, cari.text);
  }
}
