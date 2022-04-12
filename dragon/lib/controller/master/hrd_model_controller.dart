import 'package:flutter/material.dart';
import 'package:dragon/model/data_bagian.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/model/master/model_hrd_model.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HRDmodelController with ChangeNotifier {
  model_hrd_model m_order = model_hrd_model();
  TextEditingController searchController = TextEditingController();
  DateRangePickerController filter_tanggalController =
      new DateRangePickerController();
  List data_hrd_model_list = [];
  String selectedDate = '';

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController cari = TextEditingController();
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
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_hrd_model_list =
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

  //add order pembelian
  TextEditingController modelController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  List<DataBagian> data_bagian_keranjang = List<DataBagian>();
  String dr = '';
  String per = DateFormat('MM/yyyy').format(DateTime.now());
  double upahTotal = 0;
  List<DataBagian> pegawaiList = List<DataBagian>();

  Future<void> initData_addHRDmodel() async {
    data_bagian_keranjang = new List<DataBagian>();
    modelController.clear();
    notesController.clear();
    upahTotal = 0;
    await DataBagian().data_bagian('').then((value) {
      if (value != null) {
        pegawaiList.clear();
        for (int i = 0; i < value.length; i++) {
          pegawaiList.add(DataBagian.fromJson(value[i]));
        }
      }
    });
  }

  Future<void> initData_editHRDmodel(var data_edit) async {
    modelController.text = data_edit['model'];
    notesController.text = data_edit['notes'];
    // chooseDate = DateFormat("yyyy-MM-dd").parse(data_edit['TGL']);
    // status_hrd_model = data_edit['POSTED'] == 1 ? true : false;
    List data_lama = await m_order.select_hrd_model_detail(
        data_edit['model'], "model", "hrd_modeld");
    data_bagian_keranjang = new List<DataBagian>();

    for (int i = 0; i < data_lama.length; i++) {
      DataBagian mPegawai = DataBagian(
          no_id: data_lama[i]['no_id'],
          kd_bag: data_lama[i]['kd_bag'],
          nm_bag: data_lama[i]['nm_bag'],
          proses: data_lama[i]['proses'],
          urut_ke: data_lama[i]['urut_ke'],
          kode: data_lama[i]['kode'],
          item: data_lama[i]['item'],
          des1: data_lama[i]['des1'],
          upah: double.parse(data_lama[i]['upah'].toString()) ?? 0.00);
      data_bagian_keranjang.add(mPegawai);
    }
    hitungSubTotal();
    await DataBagian().data_bagian('').then((value) {
      if (value != null) {
        pegawaiList.clear();
        for (int i = 0; i < value.length; i++) {
          pegawaiList.add(DataBagian.fromJson(value[i]));
        }
      }
    });
  }

  void addKeranjang(DataBagian mPegawai) {
    // m_barang.stok_booking = 1;
    data_bagian_keranjang.add(mPegawai);
    upahTotal += mPegawai.upah ?? 0.00;
    notifyListeners();
  }

  void hitungSubTotal() {
    upahTotal = 0;
    for (int i = 0; i < data_bagian_keranjang.length; i++) {
      upahTotal += data_bagian_keranjang[i].upah ?? 0.00;
    }
    notifyListeners();
  }

  /// data header
  Future<bool> saveHRDmodel() async {
    hitungSubTotal();
    if (data_bagian_keranjang.length > 0) {
      BotToast.showLoading();
      var data_ready =
          await m_order.get_model(modelController.text, "model", "hrd_model");
      if (data_ready.length > 0) {
        Toast("Peringatan !", "No bukti '${modelController.text}' sudah ada",
            false);
        BotToast.closeAllLoading();
        return false;
      } else {
        Map obj = new Map();
        obj['model'] = 'HR' +
            per.substring(2, 4) +
            per.substring(5, 7) +
            '.' +
            per.substring(5, 7) +
            '-';
        obj['notes'] = notesController.text;
        obj['dr'] = dr;
        obj['tabeld'] = await baca_tabeld();
        await m_order.insert_hrd_model(obj);
        BotToast.closeAllLoading();
        return true;
      }
    } else {
      Toast("Peringatan !", "Belum ada detil Transaksi yang di input", false);
      return false;
    }
  }

  Future<bool> editHRDmodel() async {
    hitungSubTotal();
    if (modelController.text.isNotEmpty) {
      if (data_bagian_keranjang.length > 0) {
        BotToast.showLoading();
        Map obj = new Map();
        obj['model'] = modelController.text;
        obj['notes'] = notesController.text;
        obj['tabeld'] = await baca_tabeld();
        await m_order.update_hrd_model(obj);
        BotToast.closeAllLoading();
        Toast("Success !", "Berhasil mengedit data", true);
        return true;
      } else {
        Toast("Peringatan !", "Belum ada detil Transaksi yang di input", false);
        return false;
      }
    } else {
      Toast("Peringatan !", "Kode Bagian wajib di isi !", false);
      return false;
    }
  }

  Future<bool> deleteHRDmodel(String model) async {
    try {
      var delete = await m_order.delete_hrd_model(model);
      await selectDataPaginate(true, '');
      return true;
    } catch (e) {
      return false;
    }
  }

  /// data detail
  Future<List> baca_tabeld() async {
    List pegawaiList = [];
    for (int i = 0; i < data_bagian_keranjang.length; i++) {
      Map obj = new Map();
      obj['kd_bag'] = data_bagian_keranjang[i].kd_bag;
      obj['nm_bag'] = data_bagian_keranjang[i].nm_bag;
      obj['proses'] = data_bagian_keranjang[i].proses;
      obj['urut_ke'] = data_bagian_keranjang[i].urut_ke;
      obj['kode'] = data_bagian_keranjang[i].kode;
      obj['item'] = data_bagian_keranjang[i].item;
      obj['des1'] = data_bagian_keranjang[i].des1;
      obj['upah'] = data_bagian_keranjang[i].upah ?? 0.00;
      obj['dr'] = dr;
      pegawaiList.add(obj);
      data_bagian_keranjang[i].kd_bag;
    }
    return pegawaiList;
  }
}
