import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:dragon/model/data_premi.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/model/transaksi/model_premi_psp.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PremiPSPController with ChangeNotifier {
  model_premi_psp m_premistrong = model_premi_psp();
  TextEditingController searchController = TextEditingController();
  DateRangePickerController filter_tanggalController =
      new DateRangePickerController();
  List data_premi_psp_list = [];
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
  model_premi_psp m_premi_psp = model_premi_psp();
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
    data_premi_psp_list =
        await m_premi_psp.data_premi_psp_paginate(cari, offset, limit);
    var count = await m_premi_psp.count_premi_psp_paginate(cari);
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
  TextEditingController msController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController ppnController = TextEditingController();
  TextEditingController minussController = TextEditingController();
  TextEditingController lunas_bsController = TextEditingController();
  TextEditingController upah_tambahController = TextEditingController();
  TextEditingController pot_bonController = TextEditingController();
  List<DataPremi> data_premi_keranjang = List<DataPremi>();
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
  List<DataPremi> premiList = List<DataPremi>();

  Future<void> initData_Premi() async {
    await DataPremi().data_premi(kik_grupController.text).then((value) {
      if (value != null) {
        premiList.clear();
        for (int i = 0; i < value.length; i++) {
          premiList.add(DataPremi.fromJson(value[i]));
        }
      }
    });
  }

  Future<void> initData_addPremiPSP() async {
    data_premi_keranjang = new List<DataPremi>();
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
    initData_Premi();
  }

  Future<void> initData_editPremiPSP(var data_edit) async {
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
    List data_lama = await m_premistrong.select_premi_psp_detail(
        data_edit['no_bukti'], "no_bukti", "hrd_premid");
    data_premi_keranjang = new List<DataPremi>();

    for (int i = 0; i < data_lama.length; i++) {
      DataPremi mPremi = DataPremi(
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
      data_premi_keranjang.add(mPremi);
    }
    hitungSubTotal();
    initData_Premi();
  }

  Future<void> getData_PremiPSP(var data_edit) async {
    List data_lama = await m_premistrong.select_premi_psp_detail(
        data_edit['no_bukti'], "no_bukti", "hrd_premid");
    data_premi_keranjang = new List<DataPremi>();

    for (int i = 0; i < data_lama.length; i++) {
      DataPremi mPremi = DataPremi(
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
      data_premi_keranjang.add(mPremi);
    }
    hitungSubTotal();
  }

  void addKeranjang(DataPremi mPremi) {
    data_premi_keranjang.add(mPremi);
    qtyTotal += mPremi.qty ?? 0.00;
    jumlahTotal += mPremi.jumlah ?? 0.00;
    hrTotal += mPremi.hr ?? 0.00;
    notifyListeners();
  }

  void hitungSubTotal() {
    qtyTotal = 0;
    jumlahTotal = 0;
    hrTotal = 0;
    for (int i = 0; i < data_premi_keranjang.length; i++) {
      qtyTotal += data_premi_keranjang[i].qty ?? 0.00;
      jumlahTotal += data_premi_keranjang[i].jumlah ?? 0.00;
      hrTotal += data_premi_keranjang[i].hr ?? 0.00;
    }
    notifyListeners();
  }

  /// data header
  Future<bool> savePremiPSP() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_premi_keranjang.length > 0) {
        BotToast.showLoading();
        var data_ready = await m_premistrong.get_no_bukti(
            no_buktiController.text, "no_bukti", "hrd_premi");
        if (data_ready.length > 0) {
          Toast("Peringatan !",
              "No bukti '${no_buktiController.text}' sudah ada", false);
          BotToast.closeAllLoading();
          return false;
        } else {
          Map obj = new Map();

          await m_premistrong.urut_nobukti(per).then((value) {
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
          obj['flag'] = "STRONG";
          obj['notes'] = notesController.text;
          obj['periode'] = periode;
          obj['ppn'] = ppnController.text.replaceAll(',', '') ?? 0.0;
          obj['minuss'] = minussController.text.replaceAll(',', '') ?? 0.0;
          obj['lunas_bs'] = lunas_bsController.text.replaceAll(',', '') ?? 0.0;
          obj['upah_tambah'] =
              upah_tambahController.text.replaceAll(',', '') ?? 0.0;
          obj['pot_bon'] = pot_bonController.text.replaceAll(',', '') ?? 0.0;
          obj['tabeld'] = await baca_tabeld();
          await m_premistrong.insert_premi_psp(obj);
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

  Future<bool> editPremiPSP() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_premi_keranjang.length > 0) {
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
        await m_premistrong.update_premi_psp(obj);
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

  Future<bool> deletePremiPSP(String no_bukti) async {
    try {
      var delete = await m_premistrong.delete_premi_psp(no_bukti);
      await selectDataPaginate(true, searchController.text);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// data detail
  Future<List> baca_tabeld() async {
    List premiList = [];
    for (int i = 0; i < data_premi_keranjang.length; i++) {
      String no_kik = data_premi_keranjang[i].no_kik;
      String model = data_premi_keranjang[i].model;
      String item = data_premi_keranjang[i].item;
      String des1 = data_premi_keranjang[i].des1;
      int qty = data_premi_keranjang[i].qty;
      double upah = data_premi_keranjang[i].upah;
      double jumlah = data_premi_keranjang[i].jumlah;
      double org = data_premi_keranjang[i].org;
      double hr = data_premi_keranjang[i].hr;
      Map obj = new Map();
      obj['no_bukti'] = no_buktiController.text;
      obj['no_kik'] = data_premi_keranjang[i].no_kik ?? "";
      obj['tgl_premi'] = tglController.text;
      obj['model'] = data_premi_keranjang[i].model ?? "";
      obj['item'] = data_premi_keranjang[i].item ?? "";
      obj['des1'] = data_premi_keranjang[i].des1 ?? "";
      obj['qty'] = qty ?? 0;
      obj['upah'] = upah ?? 0;
      obj['jumlah'] = jumlah ?? 0;
      obj['org'] = org ?? 0;
      obj['hr'] = hr ?? 0;
      obj['dr'] = dr;
      obj['per'] = per;
      premiList.add(obj);
    }
    return premiList;
  }
}
