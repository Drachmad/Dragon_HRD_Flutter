import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_hrd_model.dart';
import 'package:dragon/view/base_widget/toast.dart';

class HRD_ModelController with ChangeNotifier {
  List data_hrdModelList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_hrd_model m_hrd_model = model_hrd_model();
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
    data_hrdModelList =
        await m_hrd_model.data_hrd_model_paginate(cari, offset, limit);
    var count = await m_hrd_model.count_hrd_model_paginate(cari);
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
    data_hrdModelList =
        await model_hrd_model().data_hrd_model_paginate(cari, offset, limit);
    var count = await m_hrd_model.count_hrd_model_paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah hrdmodel
  TextEditingController modelController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController drController = TextEditingController();

  void resetField() {
    modelController.clear();
    notesController.clear();
    drController.clear();
  }

  Future<bool> tambah_hrdmodel() async {
    if (modelController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['model'] = modelController.text;
      data_insert['notes'] = notesController.text;
      data_insert['dr'] = drController.text;

      await model_hrd_model().insert_data_hrdmodel(data_insert);
      Toast("Success !!", "Berhasil menambah HRD Borongan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_hrdmodel(var id) async {
    if (modelController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['model'] = modelController.text;
      data_insert['notes'] = notesController.text;
      data_insert['dr'] = drController.text;

      // print(data_insert);
      await model_hrd_model().update_data_hrdmodel_by_id(data_insert);
      Toast("Success !!", "Berhasil update HRD Borongan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_hrdmodel(var data) async {
    await model_hrd_model().delete_hrdmodel_byID(data['no_id'].toString());
    initData();
  }
}
