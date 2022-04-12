import 'package:flutter/material.dart';
import 'package:dragon/model/data_pegawai.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/model/transaksi/model_borongan.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BoronganController with ChangeNotifier {
  model_borongan m_borongan = model_borongan();
  TextEditingController searchController = TextEditingController();
  DateRangePickerController filter_tanggalController =
      new DateRangePickerController();
  List data_borongan_list = [];
  bool proses = false;
  bool isEnable_button = true;
  int index_terpilih;

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController cari = TextEditingController();
  List<DropdownMenuItem<int>> dropdownLimit;
  int totalNotaTerima = 0;
  int offset = 0;
  int limit = 0;
  double pageCount = 1;
  int page_index = 0;

  void setProsess(bool proses) {
    this.proses = proses;
  }

  ///paginate
  Future<void> initData() async {
    c_page.text = '1';
    limitPaging();
    index_terpilih = null;
    await selectDataPaginate(true, '');
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_borongan_list =
        await m_borongan.data_borongan_paginate(cari, offset, limit);
    var count = await m_borongan.count_borongan_paginate(cari);
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
  TextEditingController no_buktiController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();
  TextEditingController nm_bagController = TextEditingController();
  TextEditingController kd_grupController = TextEditingController();
  TextEditingController total_kikController = TextEditingController();
  TextEditingController lainController = TextEditingController();
  TextEditingController tot_bonController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController kik_netController = TextEditingController();
  TextEditingController tmsController = TextEditingController();
  TextEditingController premiController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  List<DataPegawai> data_pegawai_keranjang = List<DataPegawai>();
  String dr = '';
  String flag = 'BR';
  String per = DateFormat('MM/yyyy').format(DateTime.now());
  String premi = '';
  double msTotal = 0;
  double hrTotal = 0;
  double ikTotal = 0;
  double nbTotal = 0;
  double upahTotal = 0;
  double bonTotal = 0;
  double subsidiTotal = 0;
  double harianTotal = 0;
  double lainTotal = 0;
  double jumlahTotal = 0;
  List<DataPegawai> pegawaiList = List<DataPegawai>();

  Future<void> initData_addBorongan() async {
    data_pegawai_keranjang = new List<DataPegawai>();
    no_buktiController.clear();
    kd_bagController.clear();
    nm_bagController.clear();
    kd_grupController.clear();
    total_kikController.clear();
    lainController.clear();
    tot_bonController.clear();
    otherController.clear();
    kik_netController.clear();
    tmsController.clear();
    premiController.clear();
    notesController.clear();
    msTotal = 0;
    hrTotal = 0;
    ikTotal = 0;
    nbTotal = 0;
    upahTotal = 0;
    bonTotal = 0;
    subsidiTotal = 0;
    harianTotal = 0;
    lainTotal = 0;
    jumlahTotal = 0;
    await DataPegawai().data_pegawai().then((value) {
      if (value != null) {
        pegawaiList.clear();
        for (int i = 0; i < value.length; i++) {
          pegawaiList.add(DataPegawai.fromJson(value[i]));
        }
      }
    });
  }

  Future<void> initData_editBorongan(var data_edit) async {
    no_buktiController.text = data_edit['no_bukti'];
    kd_bagController.text = data_edit['kd_bag'];
    nm_bagController.text = data_edit['nm_bag'];
    kd_grupController.text = data_edit['kd_grup'];
    total_kikController.text = data_edit['total_kik'];
    lainController.text = data_edit['tlain'].toString();
    tot_bonController.text = data_edit['tbon'].toString();
    otherController.text = data_edit['other'].toString();
    kik_netController.text = data_edit['kik_nett'].toString();
    tmsController.text = data_edit['tms'].toString();
    premiController.text = data_edit['premi'].toString();
    notesController.text = data_edit['notes'].toString();
    premi = (data_edit['premi'] == '1') ? 'true' : 'false';
    List data_lama = await m_borongan.select_borongan_detail(
        data_edit['no_bukti'], "no_bukti", "hrd_absend");
    data_pegawai_keranjang = new List<DataPegawai>();

    for (int i = 0; i < data_lama.length; i++) {
      DataPegawai mPegawai = DataPegawai(
        no_id: data_lama[i]['no_id'],
        kd_peg: data_lama[i]['kd_peg'],
        nm_peg: data_lama[i]['nm_peg'],
        ptkp: data_lama[i]['ptkp'],
        st: data_lama[i]['st'],
        ms: double.parse(data_lama[i]['ms'].toString()) ?? 0.00,
        hr: double.parse(data_lama[i]['hr'].toString()) ?? 0.00,
        ik: double.parse(data_lama[i]['ik'].toString()) ?? 0.00,
        nb: double.parse(data_lama[i]['nb'].toString()) ?? 0.00,
        upah: double.parse(data_lama[i]['nett'].toString()) ?? 0.00,
        bon: double.parse(data_lama[i]['bon'].toString()) ?? 0.00,
        subsidi: double.parse(data_lama[i]['subsidi'].toString()) ?? 0.00,
        sub: double.parse(data_lama[i]['sub'].toString()) ?? 0.00,
        jumlah: double.parse(data_lama[i]['jumlah'].toString()) ?? 0.00,
      );
      data_pegawai_keranjang.add(mPegawai);
    }
    hitungSubTotal();
    await DataPegawai().data_pegawai().then((value) {
      if (value != null) {
        pegawaiList.clear();
        for (int i = 0; i < value.length; i++) {
          pegawaiList.add(DataPegawai.fromJson(value[i]));
        }
      }
    });
  }

  void addKeranjang(DataPegawai mPegawai) {
    // m_barang.stok_booking = 1;
    data_pegawai_keranjang.add(mPegawai);
    msTotal += mPegawai.ms ?? 0.00;
    hrTotal += mPegawai.hr ?? 0.00;
    ikTotal += mPegawai.ik ?? 0.00;
    nbTotal += mPegawai.nb ?? 0.00;
    upahTotal += mPegawai.upah ?? 0.00;
    bonTotal += mPegawai.bon ?? 0.00;
    subsidiTotal += mPegawai.subsidi ?? 0.00;
    harianTotal += mPegawai.harian ?? 0.00;
    lainTotal += mPegawai.lain ?? 0.00;
    jumlahTotal += mPegawai.jumlah ?? 0.00;
    notifyListeners();
  }

  void hitungSubTotal() {
    msTotal = 0;
    hrTotal = 0;
    ikTotal = 0;
    nbTotal = 0;
    upahTotal = 0;
    bonTotal = 0;
    subsidiTotal = 0;
    harianTotal = 0;
    lainTotal = 0;
    jumlahTotal = 0;
    for (int i = 0; i < data_pegawai_keranjang.length; i++) {
      msTotal += data_pegawai_keranjang[i].ms ?? 0.00;
      hrTotal += data_pegawai_keranjang[i].hr ?? 0.00;
      ikTotal += data_pegawai_keranjang[i].ik ?? 0.00;
      nbTotal += data_pegawai_keranjang[i].nb ?? 0.00;
      upahTotal += data_pegawai_keranjang[i].upah ?? 0.00;
      bonTotal += data_pegawai_keranjang[i].bon ?? 0.00;
      subsidiTotal += data_pegawai_keranjang[i].subsidi ?? 0.00;
      harianTotal += data_pegawai_keranjang[i].harian ?? 0.00;
      lainTotal += data_pegawai_keranjang[i].lain ?? 0.00;
      jumlahTotal += data_pegawai_keranjang[i].jumlah ?? 0.00;
    }
    notifyListeners();
  }

  /// data header
  Future<bool> saveBorongan() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_pegawai_keranjang.length > 0) {
        BotToast.showLoading();
        var data_ready = await m_borongan.get_no_bukti(
            no_buktiController.text, "no_bukti", "hrd_absen");
        if (data_ready.length > 0) {
          Toast("Peringatan !",
              "No bukti '${no_buktiController.text}' sudah ada", false);
          BotToast.closeAllLoading();
          return false;
        } else {
          Map obj = new Map();
          obj['no_bukti'] = per.substring(2, 4) +
              per.substring(5, 7) +
              '.' +
              dr +
              '-' +
              kd_bagController.text;
          obj['kd_bag'] = kd_bagController.text;
          obj['nm_bag'] = nm_bagController.text;
          obj['kd_grup'] = kd_grupController.text;
          obj['total_kik'] = total_kikController.text;
          obj['flag'] = flag;
          obj['dr'] = dr;
          obj['per'] = per;
          obj['premi'] = premi;
          obj['lain'] = lainController.text.replaceAll(",", "");
          obj['tot_bon'] = tot_bonController.text.replaceAll(",", "");
          obj['other'] = otherController.text.replaceAll(",", "");
          obj['kik_net'] = kik_netController.text.replaceAll(",", "");
          obj['tms'] = tmsController.text.replaceAll(",", "");
          obj['notes'] = notesController.text;
          obj['tabeld'] = await baca_tabeld();
          await m_borongan.insert_borongan(obj);
          BotToast.closeAllLoading();
          return true;
        }
      } else {
        Toast("Peringatan !", "Belum ada detil Transaksi yang di input", false);
        return false;
      }
    } else {
      Toast("Peringatan !", "Kode Bagian wajib di isi !", false);
      return false;
    }
  }

  Future<bool> editBorongan() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_pegawai_keranjang.length > 0) {
        BotToast.showLoading();
        Map obj = new Map();
        obj['flag'] = flag;
        obj['dr'] = dr;
        obj['per'] = per;
        obj['premi'] = premi;
        obj['no_bukti'] = no_buktiController.text;
        obj['kd_bag'] = kd_bagController.text;
        obj['nm_bag'] = nm_bagController.text;
        obj['kd_grup'] = kd_grupController.text;
        obj['total_kik'] = total_kikController.text;
        obj['lain'] = lainController.text.replaceAll(",", "");
        obj['tot_bon'] = tot_bonController.text.replaceAll(",", "");
        obj['other'] = otherController.text.replaceAll(",", "");
        obj['kik_net'] = kik_netController.text.replaceAll(",", "");
        obj['tms'] = tmsController.text.replaceAll(",", "");
        obj['notes'] = notesController.text;
        obj['tabeld'] = await baca_tabeld();
        await m_borongan.update_borongan(obj);
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

  Future<bool> deleteBorongan(String no_bukti) async {
    try {
      var delete = await m_borongan.delete_borongan(no_bukti);
      await selectDataPaginate(true, '');
      return true;
    } catch (e) {
      return false;
    }
  }

  /// data detail
  Future<List> baca_tabeld() async {
    List pegawaiList = [];
    for (int i = 0; i < data_pegawai_keranjang.length; i++) {
      double ms = data_pegawai_keranjang[i].ms;
      double hr = data_pegawai_keranjang[i].hr;
      double ik = data_pegawai_keranjang[i].ik;
      double nb = data_pegawai_keranjang[i].nb;
      double upah = data_pegawai_keranjang[i].upah;
      double bon = data_pegawai_keranjang[i].bon;
      double subsidi = data_pegawai_keranjang[i].subsidi;
      double sub = data_pegawai_keranjang[i].sub;
      double harian = data_pegawai_keranjang[i].harian;
      double lain = data_pegawai_keranjang[i].lain;
      double jumlah = data_pegawai_keranjang[i].jumlah;
      Map obj = new Map();
      obj['no_bukti'] = no_buktiController.text;
      obj['kd_bag'] = kd_bagController.text;
      obj['nm_bag'] = nm_bagController.text;
      obj['kd_peg'] = data_pegawai_keranjang[i].kd_peg;
      obj['nm_peg'] = data_pegawai_keranjang[i].nm_peg;
      obj['ptkp'] = data_pegawai_keranjang[i].ptkp;
      obj['st'] = data_pegawai_keranjang[i].st;
      obj['ms'] = ms ?? 0.00;
      obj['hr'] = hr ?? 0.00;
      obj['ik'] = ik ?? 0.00;
      obj['nb'] = nb ?? 0.00;
      obj['upah'] = upah ?? 0.00;
      obj['bon'] = bon ?? 0.00;
      obj['subsidi'] = subsidi ?? 0.00;
      obj['sub'] = sub ?? 0.00;
      obj['harian'] = harian ?? 0.00;
      obj['lain'] = lain ?? 0.00;
      obj['jumlah'] = jumlah ?? 0.00;
      pegawaiList.add(obj);
    }
    return pegawaiList;
  }
}
