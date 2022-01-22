import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_sp_inventori.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SP_InventoriController with ChangeNotifier {
  List data_spInventoriList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_sp_inventori m_sp_bagian = model_sp_inventori();
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
    data_spInventoriList =
        await m_sp_bagian.data_sp_inventori_paginate(cari, offset, limit);
    var count = await m_sp_bagian.count_sp_inventori_Paginate(cari);
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
    data_spInventoriList = await model_sp_inventori()
        .data_sp_inventori_paginate(cari, offset, limit);
    var count = await m_sp_bagian.count_sp_inventori_Paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah inventori
  TextEditingController no_buktiController = TextEditingController();
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController bagianController = TextEditingController();
  TextEditingController j_barangController = TextEditingController();
  TextEditingController merkController = TextEditingController();
  TextEditingController tgl_maController = TextEditingController();
  TextEditingController tgl_keController = TextEditingController();
  TextEditingController tgl_mutasiController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController keterController = TextEditingController();
  TextEditingController tempatController = TextEditingController();
  TextEditingController recController = TextEditingController();
  TextEditingController kd_brgController = TextEditingController();
  DateTime chooseDate = DateTime.now();
  final format_tanggal = new DateFormat("yyyy-MM-DD");

  void resetField() {
    no_buktiController.clear();
    kodeController.clear();
    namaController.clear();
    bagianController.clear();
    j_barangController.clear();
    merkController.clear();
    tgl_maController.clear();
    tgl_keController.clear();
    tgl_mutasiController.clear();
    jumlahController.clear();
    satuanController.clear();
    keterController.clear();
    tempatController.clear();
    recController.clear();
    kd_brgController.clear();
  }

  Future<bool> tambah_inventori() async {
    if (no_buktiController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['no_bukti'] = no_buktiController.text;
      data_insert['kode'] = kodeController.text;
      data_insert['nama'] = namaController.text;
      data_insert['bagian'] = bagianController.text;
      data_insert['j_barang'] = j_barangController.text;
      data_insert['merk'] = merkController.text;
      data_insert['tgl_ma'] = tgl_maController.text;
      data_insert['tgl_ke'] = tgl_keController.text;
      data_insert['tgl_mutasi'] = tgl_mutasiController.text;
      data_insert['jumlah'] = jumlahController.text;
      data_insert['satuan'] = satuanController.text;
      data_insert['keter'] = keterController.text;
      data_insert['tempat'] = tempatController.text;
      data_insert['rec'] = recController.text;
      data_insert['kd_brg'] = kd_brgController.text;
      await model_sp_inventori().insert_data_inventori(data_insert);
      Toast("Success !!", "Berhasil menambah inventori !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_inventori(var id) async {
    if (bagianController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['no_bukti'] = no_buktiController.text;
      data_insert['kode'] = kodeController.text;
      data_insert['nama'] = namaController.text;
      data_insert['bagian'] = bagianController.text;
      data_insert['j_barang'] = j_barangController.text;
      data_insert['merk'] = merkController.text;
      data_insert['tgl_ma'] = tgl_maController.text;
      data_insert['tgl_ke'] = tgl_keController.text;
      data_insert['tgl_mutasi'] = tgl_mutasiController.text;
      data_insert['jumlah'] = jumlahController.text;
      data_insert['satuan'] = satuanController.text;
      data_insert['keter'] = keterController.text;
      data_insert['tempat'] = tempatController.text;
      data_insert['rec'] = recController.text;
      data_insert['kd_brg'] = kd_brgController.text;
      // print(data_insert);
      await model_sp_inventori().update_data_inventori_by_id(data_insert);
      Toast("Success !!", "Berhasil update inventori !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_inventori(var data) async {
    await model_sp_inventori().delete_inventori_byID(data['no_id'].toString());
    initData();
  }
}
