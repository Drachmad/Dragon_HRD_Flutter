import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/model/master/model_hrd_pegawai.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HRD_PegawaiController with ChangeNotifier {
  List data_hrdPegawaiList = [];
  bool proses = false;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_hrd_pegawai m_hrd_pegawai = model_hrd_pegawai();
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
    data_hrdPegawaiList =
        await m_hrd_pegawai.data_hrd_pegawai_paginate(cari, offset, limit);
    var count = await m_hrd_pegawai.count_hrd_pegawai_paginate(cari);
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
    data_hrdPegawaiList = await model_hrd_pegawai()
        .data_hrd_pegawai_paginate(cari, offset, limit);
    var count = await m_hrd_pegawai.count_hrd_pegawai_paginate(cari);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  //variable tambah pegawai
  TextEditingController nikController = TextEditingController();
  TextEditingController nm_pegController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();
  TextEditingController nm_bagController = TextEditingController();
  TextEditingController aktifController = TextEditingController();
  String jk;
  TextEditingController kpjController = TextEditingController();
  TextEditingController bpjsController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController kabController = TextEditingController();
  TextEditingController pendidikanController = TextEditingController();
  TextEditingController tgl_masukController = TextEditingController();
  TextEditingController drController = TextEditingController();
  TextEditingController recController = TextEditingController();
  TextEditingController pokokController = TextEditingController();
  TextEditingController umakanController = TextEditingController();
  TextEditingController tjabatanController = TextEditingController();
  TextEditingController tperbulanController = TextEditingController();
  TextEditingController tastekController = TextEditingController();
  TextEditingController premiController = TextEditingController();
  TextEditingController lblController = TextEditingController();
  TextEditingController ulemburController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController nettController = TextEditingController();
  DateTime chooseDate = DateTime.now();
  final format_tanggal = new DateFormat("yyyy-MM-DD");

  void resetField() {
    nikController.clear();
    nm_pegController.clear();
    kd_bagController.clear();
    nm_bagController.clear();
    aktifController.clear();
    kpjController.clear();
    bpjsController.clear();
    alamatController.clear();
    kotaController.clear();
    kabController.clear();
    pendidikanController.clear();
    tgl_masukController.clear();
    drController.clear();
    recController.clear();
    pokokController.clear();
    umakanController.clear();
    tjabatanController.clear();
    tperbulanController.clear();
    tastekController.clear();
    premiController.clear();
    lblController.clear();
    ulemburController.clear();
    gajiController.clear();
    nettController.clear();
  }

  Future<bool> tambah_pegawai() async {
    if (nikController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = null;
      data_insert['nik'] = nikController.text;
      data_insert['nm_peg'] = nm_pegController.text;
      data_insert['kd_bag'] = kd_bagController.text;
      data_insert['nm_bag'] = nm_bagController.text;
      data_insert['aktif'] = aktifController.text;
      data_insert['jk'] = jk;
      data_insert['kpj'] = kpjController.text;
      data_insert['bpjs'] = bpjsController.text;
      data_insert['alamat'] = alamatController.text;
      data_insert['kota'] = kotaController.text;
      data_insert['kab'] = kabController.text;
      data_insert['pendidikan'] = pendidikanController.text;
      data_insert['tgl_masuk'] = tgl_masukController.text;
      data_insert['dr'] = drController.text;
      data_insert['rec'] = recController.text;
      data_insert['pokok'] = pokokController.text;
      data_insert['umakan'] = umakanController.text;
      data_insert['tjabatan'] = tjabatanController.text;
      data_insert['tperbulan'] = tperbulanController.text;
      data_insert['tastek'] = tastekController.text;
      data_insert['premi'] = premiController.text;
      data_insert['lbl'] = lblController.text;
      data_insert['ulembur'] = ulemburController.text;
      data_insert['gaji'] = gajiController.text;
      data_insert['nett'] = nettController.text;
      await model_hrd_pegawai().insert_data_pegawai(data_insert);
      Toast("Success !!", "Berhasil menambah pegawai !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua kolom !", false);
      return false;
    }
  }

  Future<bool> edit_pegawai(var id) async {
    if (nikController.text.isNotEmpty) {
      BotToast.showLoading();
      Map data_insert = new Map();
      data_insert['no_id'] = id;
      data_insert['nik'] = nikController.text;
      data_insert['nm_peg'] = nm_pegController.text;
      data_insert['kd_bag'] = kd_bagController.text;
      data_insert['nm_bag'] = nm_bagController.text;
      data_insert['aktif'] = aktifController.text;
      data_insert['jk'] = jk;
      data_insert['kpj'] = kpjController.text;
      data_insert['bpjs'] = bpjsController.text;
      data_insert['alamat'] = alamatController.text;
      data_insert['kota'] = kotaController.text;
      data_insert['kab'] = kabController.text;
      data_insert['pendidikan'] = pendidikanController.text;
      data_insert['tgl_masuk'] = tgl_masukController.text;
      data_insert['dr'] = drController.text;
      data_insert['rec'] = recController.text;
      data_insert['pokok'] = pokokController.text;
      data_insert['umakan'] = umakanController.text;
      data_insert['tjabatan'] = tjabatanController.text;
      data_insert['tperbulan'] = tperbulanController.text;
      data_insert['tastek'] = tastekController.text;
      data_insert['premi'] = premiController.text;
      data_insert['lbl'] = lblController.text;
      data_insert['ulembur'] = ulemburController.text;
      data_insert['gaji'] = gajiController.text;
      data_insert['nett'] = nettController.text;
      // print(data_insert);
      await model_hrd_pegawai().update_data_pegawai_by_id(data_insert);
      Toast("Success !!", "Berhasil update pegawai !", true);
      BotToast.closeAllLoading();
      return true;
    } else {
      Toast("Peringatan !", "Silahkan isi semua data !", false);
      return false;
    }
  }

  Future<bool> hapus_pegawai(var data) async {
    await model_hrd_pegawai().delete_pegawai_byID(data['no_id'].toString());
    initData();
  }
}
