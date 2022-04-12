import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:dragon/model/data_kik.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/model/transaksi/model_kik_juki.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class KikJukiController with ChangeNotifier {
  model_kik_juki m_kikjuki = model_kik_juki();
  TextEditingController searchController = TextEditingController();
  DateRangePickerController filter_tanggalController =
      new DateRangePickerController();
  List data_kik_juki_list = [];
  bool proses = false;
  bool isEnable_button = true;
  String selectedDate = '';
  String dateCount = '';
  String range = 'Pilih tanggal';
  String rangeCount = '';
  String tanggal_awal = "";
  String tanggal_akhir = "";
  int index_terpilih;

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController cari = TextEditingController();
  model_kik_juki m_kik_juki = model_kik_juki();
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

    index_terpilih = null;
    tanggal_awal =
        DateFormat('yyyy-MM-dd', "id_ID").format(DateTime.now()).toString();
    tanggal_akhir =
        DateFormat('yyyy-MM-dd', "id_ID").format(DateTime.now()).toString();
    range =
        DateFormat('dd/MM/yyyy', "id_ID").format(DateTime.now()).toString() +
            ' - ' +
            DateFormat('dd/MM/yyyy', "id_ID").format(DateTime.now()).toString();

    await selectDataPaginate(true, searchController.text);

    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_kik_juki_list =
        await m_kik_juki.data_kik_juki_paginate(cari, offset, limit);
    var count = await m_kik_juki.count_kik_juki_paginate(cari);
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

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value != null) {
      if (args.value is PickerDateRange) {
        if (args.value.startDate != null) {
          range = DateFormat('dd/MM/yyyy', "id_ID")
                  .format(args.value.startDate)
                  .toString() +
              ' - ' +
              DateFormat('dd/MM/yyyy', "id_ID")
                  .format(args.value.endDate ?? args.value.startDate)
                  .toString();
        }
        if (args.value.startDate != null && args.value.endDate != null) {
          tanggal_awal = DateFormat('yyyy-MM-dd', "id_ID")
              .format(args.value.startDate)
              .toString();
          tanggal_akhir = DateFormat('yyyy-MM-dd', "id_ID")
              .format(args.value.endDate)
              .toString();
          isEnable_button = true;
        } else {
          isEnable_button = false;
        }
      } else if (args.value is DateTime) {
        selectedDate = args.value.toString();
        isEnable_button = false;
      } else if (args.value is List<DateTime>) {
        dateCount = args.value.length.toString();
        isEnable_button = false;
      } else {
        rangeCount = args.value.length.toString();
        isEnable_button = false;
      }
      notifyListeners();
    }
  }

  //add order pembelian
  TextEditingController no_buktiController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();
  TextEditingController nm_bagController = TextEditingController();
  TextEditingController kik_grupController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController ppnController = TextEditingController();
  TextEditingController minussController = TextEditingController();
  TextEditingController lunas_bsController = TextEditingController();
  TextEditingController upah_tambahController = TextEditingController();
  TextEditingController pot_bonController = TextEditingController();
  List<DataKIK> data_kik_keranjang = List<DataKIK>();
  final formatter = intl.NumberFormat.decimalPattern();
  String dr = '';
  int no_urut = 0;
  DateTime chooseDate = DateTime.now();
  final format_tanggal = DateFormat("yyyy-MM-dd");
  double qtyTotal = 0;
  double jumlahTotal = 0;
  double hrTotal = 0;
  String periode;
  String per = DateFormat('MM/yyyy').format(DateTime.now());
  String nobukti = DateFormat('yy/MM').format(DateTime.now());
  List<DataKIK> kikList = List<DataKIK>();

  Future<void> initData_KIK() async {
    await DataKIK().data_kik(kik_grupController.text).then((value) {
      if (value != null) {
        kikList.clear();
        for (int i = 0; i < value.length; i++) {
          kikList.add(DataKIK.fromJson(value[i]));
        }
      }
    });
  }

  Future<void> initData_addKikJuki() async {
    data_kik_keranjang = new List<DataKIK>();
    no_buktiController.clear();
    kd_bagController.clear();
    nm_bagController.clear();
    kik_grupController.clear();
    notesController.clear();
    ppnController.clear();
    minussController.clear();
    lunas_bsController.clear();
    upah_tambahController.clear();
    pot_bonController.clear();
    periode = "1";
    qtyTotal = 0;
    jumlahTotal = 0;
    hrTotal = 0;
    initData_KIK();
  }

  Future<void> initData_editKikJuki(var data_edit) async {
    no_buktiController.text = data_edit['no_bukti'];
    kd_bagController.text = data_edit['kd_bag'];
    nm_bagController.text = data_edit['nm_bag'];
    kik_grupController.text = data_edit['kik_grup'];
    notesController.text = data_edit['notes'];
    ppnController.text = formatter.format(data_edit['ppn']).toString();
    minussController.text = formatter.format(data_edit['minuss']).toString();
    lunas_bsController.text =
        formatter.format(data_edit['lunas_bs']).toString();
    upah_tambahController.text =
        formatter.format(data_edit['upah_tambah']).toString();
    pot_bonController.text = formatter.format(data_edit['pot_bon']).toString();
    List data_lama = await m_kikjuki.select_kik_juki_detail(
        data_edit['no_bukti'], "no_bukti", "hrd_kikd");
    data_kik_keranjang = new List<DataKIK>();

    for (int i = 0; i < data_lama.length; i++) {
      DataKIK mKIK = DataKIK(
        no_kik: data_lama[i]['no_kik'] ?? "",
        model: data_lama[i]['model'] ?? "",
        item: data_lama[i]['item'] ?? 0,
        des1: data_lama[i]['des1'] ?? "",
        qty: data_lama[i]['qty'] ?? 0.0,
        upah: data_lama[i]['upah'] ?? 0.0,
        jumlah: data_lama[i]['jumlah'].toDouble() ?? 0.0,
        org: data_lama[i]['org'].toDouble() ?? 0.0,
        hr: data_lama[i]['hr'].toDouble() ?? 0.0,
      );
      data_kik_keranjang.add(mKIK);
    }
    hitungSubTotal();
    initData_KIK();
  }

  void addKeranjang(DataKIK mKIK) {
    data_kik_keranjang.add(mKIK);
    qtyTotal += mKIK.qty ?? 0.00;
    jumlahTotal += mKIK.jumlah ?? 0.00;
    hrTotal += mKIK.hr ?? 0.00;
    notifyListeners();
  }

  void hitungSubTotal() {
    qtyTotal = 0;
    jumlahTotal = 0;
    hrTotal = 0;
    for (int i = 0; i < data_kik_keranjang.length; i++) {
      qtyTotal += data_kik_keranjang[i].qty ?? 0.00;
      jumlahTotal += data_kik_keranjang[i].jumlah ?? 0.00;
      hrTotal += data_kik_keranjang[i].hr ?? 0.00;
    }
    notifyListeners();
  }

  /// data header
  Future<bool> saveKikJuki() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_kik_keranjang.length > 0) {
        BotToast.showLoading();
        var data_ready = await m_kikjuki.get_no_bukti(
            no_buktiController.text, "no_bukti", "hrd_kik");
        if (data_ready.length > 0) {
          Toast("Peringatan !",
              "No bukti '${no_buktiController.text}' sudah ada", false);
          BotToast.closeAllLoading();
          return false;
        } else {
          Map obj = new Map();

          await m_kikjuki.urut_nobukti(per).then((value) {
            if (value != null) {
              if (value.length > 0) {
                no_urut = value.length;
              } else {
                no_urut = 0;
              }
              obj['no_bukti'] = nobukti.replaceAll('/', '') +
                  '.' +
                  "${no_urut + 1}" +
                  '-' +
                  "DR" +
                  dr +
                  '-' +
                  kd_bagController.text;
            }
          });

          obj['per'] = per;
          obj['dr'] = dr;
          obj['kd_bag'] = kd_bagController.text;
          obj['nm_bag'] = nm_bagController.text;
          obj['kik_grup'] = kik_grupController.text;
          obj['tqty'] = qtyTotal;
          obj['tjumlah'] = jumlahTotal;
          obj['t_hr'] = hrTotal;
          obj['flag'] = "JUKI";
          obj['notes'] = notesController.text;
          obj['periode'] = periode;
          obj['ppn'] = ppnController.text.replaceAll(',', '') ?? 0.0;
          obj['minuss'] = minussController.text.replaceAll(',', '') ?? 0.0;
          obj['lunas_bs'] = lunas_bsController.text.replaceAll(',', '') ?? 0.0;
          obj['upah_tambah'] =
              upah_tambahController.text.replaceAll(',', '') ?? 0.0;
          obj['pot_bon'] = pot_bonController.text.replaceAll(',', '') ?? 0.0;
          obj['tabeld'] = await baca_tabeld();
          await m_kikjuki.insert_kik_juki(obj);
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

  Future<bool> editKikJuki() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_kik_keranjang.length > 0) {
        BotToast.showLoading();
        Map obj = new Map();
        obj['no_bukti'] = no_buktiController.text;
        obj['kd_bag'] = kd_bagController.text;
        obj['nm_bag'] = nm_bagController.text;
        obj['kik_grup'] = kik_grupController.text;
        obj['notes'] = notesController.text;
        obj['periode'] = periode;
        obj['ppn'] = ppnController.text;
        obj['minuss'] = minussController.text;
        obj['lunas_bs'] = lunas_bsController.text;
        obj['upah_tambah'] = upah_tambahController.text;
        obj['pot_bon'] = pot_bonController.text;
        obj['tabeld'] = await baca_tabeld();
        await m_kikjuki.update_kik_juki(obj);
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

  Future<bool> deleteKikJuki(String no_bukti) async {
    try {
      var delete = await m_kikjuki.delete_kik_juki(no_bukti);
      await selectDataPaginate(true, searchController.text);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// data detail
  Future<List> baca_tabeld() async {
    List kikList = [];
    for (int i = 0; i < data_kik_keranjang.length; i++) {
      String no_kik = data_kik_keranjang[i].no_kik;
      String model = data_kik_keranjang[i].model;
      String item = data_kik_keranjang[i].item;
      String des1 = data_kik_keranjang[i].des1;
      int qty = data_kik_keranjang[i].qty;
      double upah = data_kik_keranjang[i].upah;
      double jumlah = data_kik_keranjang[i].jumlah;
      double org = data_kik_keranjang[i].org;
      double hr = data_kik_keranjang[i].hr;
      Map obj = new Map();
      obj['no_bukti'] = no_buktiController.text;
      obj['no_kik'] = data_kik_keranjang[i].no_kik ?? "";
      obj['tgl_kik'] = tglController.text;
      obj['model'] = data_kik_keranjang[i].model ?? "";
      obj['item'] = data_kik_keranjang[i].item ?? "";
      obj['des1'] = data_kik_keranjang[i].des1 ?? "";
      obj['qty'] = qty ?? 0;
      obj['upah'] = upah ?? 0;
      obj['jumlah'] = jumlah ?? 0;
      obj['org'] = org ?? 0;
      obj['hr'] = hr ?? 0;
      obj['dr'] = dr;
      obj['per'] = per;
      kikList.add(obj);
    }
    return kikList;
  }
}
