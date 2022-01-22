import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_hrd_grup.dart';
import 'package:dragon/view/base_widget/toast.dart';

class HRD_GrupController with ChangeNotifier {
  List data_hrdGrupList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_hrd_grup m_hrd_grup = model_hrd_grup();
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
    data_hrdGrupList =
        await m_hrd_grup.data_hrd_grup_paginate(cari, offset, limit);
    var count = await m_hrd_grup.count_hrd_grup_paginate(cari);
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
    // await selectDataPaginate(true);
    data_hrdGrupList =
        await model_hrd_grup().data_hrd_grup_paginate(cari, offset, limit);
    var count = await m_hrd_grup.count_hrd_grup_paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah hrdgrup
  TextEditingController kd_grupController = TextEditingController();
  TextEditingController nm_grupController = TextEditingController();
  TextEditingController acnoController = TextEditingController();

  void resetField() {
    kd_grupController.clear();
    nm_grupController.clear();
    acnoController.clear();
  }

  Future<bool> tambah_hrdgrup() async {
    if (kd_grupController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['kd_grup'] = kd_grupController.text;
      data_insert['nm_grup'] = nm_grupController.text;
      data_insert['acno'] = acnoController.text;

      await model_hrd_grup().insert_data_hrdgrup(data_insert);
      Toast("Success !!", "Berhasil menambah HRD Grup !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_hrdgrup(var id) async {
    if (kd_grupController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['kd_grup'] = kd_grupController.text;
      data_insert['nm_grup'] = nm_grupController.text;
      data_insert['acno'] = acnoController.text;

      // print(data_insert);
      await model_hrd_grup().update_data_hrdgrup_by_id(data_insert);
      Toast("Success !!", "Berhasil update HRD Grup !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_hrdgrup(var data) async {
    await model_hrd_grup().delete_hrdgrup_byID(data['no_id'].toString());
    initData();
  }
}
