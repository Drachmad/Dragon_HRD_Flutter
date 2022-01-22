import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_pembelian_supplier.dart';
import 'package:dragon/view/base_widget/toast.dart';

class Pembelian_SupplierController with ChangeNotifier {
  List data_pembelianSupplierList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_pembelian_supplier m_pembelian_supplier = model_pembelian_supplier();
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
    data_pembelianSupplierList = await m_pembelian_supplier
        .data_pembelian_supplier_paginate(cari, offset, limit);
    var count =
        await m_pembelian_supplier.count_pembelian_supplier_paginate(cari);
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
    data_pembelianSupplierList = await model_pembelian_supplier()
        .data_pembelian_supplier_paginate(cari, offset, limit);
    var count =
        await m_pembelian_supplier.count_pembelian_supplier_paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah pemsupplier
  TextEditingController KODESController = TextEditingController();
  TextEditingController NAMASController = TextEditingController();
  TextEditingController KOTAController = TextEditingController();

  void resetField() {
    KODESController.clear();
    NAMASController.clear();
    KOTAController.clear();
  }

  Future<bool> tambah_pemsupplier() async {
    if (KODESController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['NO_ID'] = null;
      data_insert['KODES'] = KODESController.text;
      data_insert['NAMAS'] = NAMASController.text;
      data_insert['KOTA'] = KOTAController.text;

      await model_pembelian_supplier().insert_data_pemsupplier(data_insert);
      Toast("Success !!", "Berhasil menambah HRD Borongan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_pemsupplier(var id) async {
    if (KODESController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['NO_ID'] = id;
      data_insert['KODES'] = KODESController.text;
      data_insert['NAMAS'] = NAMASController.text;
      data_insert['KOTA'] = KOTAController.text;

      // print(data_insert);
      await model_pembelian_supplier()
          .update_data_pemsupplier_by_id(data_insert);
      Toast("Success !!", "Berhasil update HRD Borongan !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_pemsupplier(var data) async {
    await model_pembelian_supplier()
        .delete_pemsupplier_byID(data['NO_ID'].toString());
    initData();
  }
}
