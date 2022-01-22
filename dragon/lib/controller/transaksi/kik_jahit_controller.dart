import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/model/data_pegawai.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/model/transaksi/model_kik_jahit.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class KikJahitController with ChangeNotifier {
  model_kik_jahit m_order = model_kik_jahit();
  TextEditingController searchController = TextEditingController();
  DateRangePickerController filter_tanggalController =
      new DateRangePickerController();
  List data_kik_jahit_list = [];
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
  model_kik_jahit m_kik_jahit = model_kik_jahit();
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

    await selectDataPaginate(true, '');

    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_kik_jahit_list =
        await m_kik_jahit.data_kik_jahit_paginate(cari, offset, limit);
    var count = await m_kik_jahit.count_kik_jahit_paginate(cari);
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

  // Future<void> select_data() async {
  //   data_kik_jahit_list = await m_order.data_kik_jahit_paginate(
  //       searchController.text, tanggal_awal, tanggal_akhir);
  //   notifyListeners();
  // }

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

  // void proses_export() {
  //   if (data_kik_jahit_list.length > 0) {
  //     BotToast.showLoading();
  //     List header_excel = new List();
  //     List isi_excel = new List();
  //     header_excel.add("Tanggal");
  //     header_excel.add("No bukti");
  //     header_excel.add("Sales");
  //     header_excel.add("Customer");
  //     header_excel.add("keterangan");
  //     header_excel.add("Qty");
  //     header_excel.add("Total");
  //     header_excel.add("Status");
  //     for (int i = 0; i < data_kik_jahit_list.length; i++) {
  //       Map<String, dynamic> isi_map = new Map<String, dynamic>();
  //       isi_map['a'] = data_kik_jahit_list[i]['tanggal'];
  //       isi_map['b'] = data_kik_jahit_list[i]['no_bukti'];
  //       isi_map['c'] = data_kik_jahit_list[i]['sales'];
  //       isi_map['d'] = data_kik_jahit_list[i]['customer'];
  //       isi_map['e'] = data_kik_jahit_list[i]['keterangan'];
  //       isi_map['f'] = data_kik_jahit_list[i]['total_qty'];
  //       isi_map['g'] = data_kik_jahit_list[i]['total_so'];
  //       if (data_kik_jahit_list[i]['status'] == 1) {
  //         isi_map['h'] = "Diterima";
  //       } else {
  //         isi_map['h'] = "Belum Diterima";
  //       }
  //       isi_excel.add(isi_map);
  //     }
  //     String judul = "Laporan Order Penjualan (${range.replaceAll("/", "")})";
  //     config().createExcel(header_excel, isi_excel, judul);
  //   } else {
  //     Toast("Tidak ada data untuk di export", "", false);
  //   }
  // }

  // Future<void> proses_export_detail() async {
  //   if (index_terpilih != null) {
  //     BotToast.showLoading();
  //     List header_excel = new List();
  //     List header_detail_excel = new List();
  //     List isi_excel = new List();
  //     List isi_detail_excel = new List();
  //     List footer_excel = new List();
  //     header_excel.add("Tanggal");
  //     header_excel.add("No bukti");
  //     header_excel.add("Sales");
  //     header_excel.add("Customer");
  //     header_excel.add("keterangan");
  //     header_excel.add("Status");
  //     Map<String, dynamic> map_transaksi = new Map<String, dynamic>();
  //     map_transaksi['a'] = data_kik_jahit_list[index_terpilih]['tanggal'];
  //     map_transaksi['b'] = data_kik_jahit_list[index_terpilih]['no_bukti'];
  //     map_transaksi['c'] = data_kik_jahit_list[index_terpilih]['sales'];
  //     map_transaksi['d'] = data_kik_jahit_list[index_terpilih]['customer'];
  //     map_transaksi['e'] = data_kik_jahit_list[index_terpilih]['keterangan'];
  //     if (data_kik_jahit_list[index_terpilih]['status'] == 1) {
  //       map_transaksi['f'] = "Diterima";
  //     } else {
  //       map_transaksi['f'] = "Belum Diterima";
  //     }
  //     isi_excel.add(map_transaksi);

  //     header_detail_excel.add("Kode Barang");
  //     header_detail_excel.add("Nama Barang");
  //     header_detail_excel.add("Satuan");
  //     header_detail_excel.add("Qty");
  //     header_detail_excel.add("Harga");
  //     header_detail_excel.add("SubTotal");
  //     List data_pegawai = await m_order.select_kik_jahit_detail(
  //         data_kik_jahit_list[index_terpilih]['no_bukti'], "no_bukti", "hrd_absen");
  //     for (int i = 0; i < data_pegawai.length; i++) {
  //       Map<String, dynamic> isi_map = new Map<String, dynamic>();
  //       isi_map['a'] = data_pegawai[i]['kode_barang'];
  //       isi_map['b'] = data_pegawai[i]['nama_barang'];
  //       isi_map['c'] = data_pegawai[i]['satuan'];
  //       isi_map['d'] = data_pegawai[i]['qty'];
  //       isi_map['e'] = data_pegawai[i]['harga_so'];
  //       isi_map['f'] = data_pegawai[i]['sub_total'];
  //       isi_detail_excel.add(isi_map);
  //     }
  //     footer_excel.add("");
  //     footer_excel.add("");
  //     footer_excel.add("Jumlah");
  //     footer_excel.add(data_kik_jahit_list[index_terpilih]['total_qty']);
  //     footer_excel.add("Total");
  //     footer_excel.add(data_kik_jahit_list[index_terpilih]['total_so']);
  //     String judul =
  //         "Invoice Order Penjualan (${data_kik_jahit_list[index_terpilih]['no_bukti']})";
  //     config().createExcel2(header_excel, header_detail_excel, isi_excel,
  //         isi_detail_excel, footer_excel, judul);
  //   } else {
  //     Toast("Silahkan pilih 1 invoice untuk di download !", "", false);
  //   }
  // }

  // Future<void> proses_print() async {
  //   List data_pegawai = await m_order.select_kik_jahit_detail(
  //       data_kik_jahit_list[index_terpilih]['no_bukti'], "no_bukti", "hrd_absen");
  //   // InvoiceOrderPenjualan()
  //   //     .proses_print(data_kik_jahit_list[index_terpilih], data_pegawai);
  // }

  //add order pembelian
  TextEditingController no_buktiController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();
  TextEditingController nm_bagController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  List<DataPegawai> data_pegawai_keranjang = List<DataPegawai>();
  double sumQty = 0;
  double hrTotal = 0;
  double jam1Total = 0;
  double jam2Total = 0;
  double jam1rpTotal = 0;
  double jam2rpTotal = 0;
  double lainTotal = 0;
  double insentifbulananTotal = 0;
  double jumlahTotal = 0;
  String per = DateTime.now().toString();
  List<DataPegawai> pegawaiList = List<DataPegawai>();

  Future<void> initData_addKikJahit() async {
    data_pegawai_keranjang = new List<DataPegawai>();
    no_buktiController.clear();
    kd_bagController.clear();
    nm_bagController.clear();
    notesController.clear();
    sumQty = 0;
    hrTotal = 0;
    jam1Total = 0;
    jam2Total = 0;
    jam1rpTotal = 0;
    jam2rpTotal = 0;
    lainTotal = 0;
    insentifbulananTotal = 0;
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

  Future<void> initData_editKikJahit(var data_edit) async {
    no_buktiController.text = data_edit['no_bukti'];
    kd_bagController.text = data_edit['kd_bag'];
    nm_bagController.text = data_edit['nm_bag'];
    notesController.text = data_edit['notes'];
    // chooseDate = DateFormat("yyyy-MM-dd").parse(data_edit['TGL']);
    // status_kik_jahit = data_edit['POSTED'] == 1 ? true : false;
    List data_lama = await m_order.select_kik_jahit_detail(
        data_edit['no_bukti'], "no_bukti", "hrd_absend");
    data_pegawai_keranjang = new List<DataPegawai>();

    for (int i = 0; i < data_lama.length; i++) {
      DataPegawai mPegawai = DataPegawai(
        noid: data_lama[i]['no_id'],
        kd_peg: data_lama[i]['kd_peg'],
        nm_peg: data_lama[i]['nm_peg'],
        ptkp: data_lama[i]['ptkp'],
        hr: double.parse(data_lama[i]['hr'].toString()) ?? 0.00,
        jam1: double.parse(data_lama[i]['jam1'].toString()) ?? 0.00,
        jam2: double.parse(data_lama[i]['jam2'].toString()) ?? 0.00,
        jam1rp: double.parse(data_lama[i]['jam1rp'].toString()) ?? 0.00,
        jam2rp: double.parse(data_lama[i]['jam2rp'].toString()) ?? 0.00,
        lain: double.parse(data_lama[i]['lain'].toString()) ?? 0.00,
        insentifbulanan:
            double.parse(data_lama[i]['tperbulan'].toString()) ?? 0.00,
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
    sumQty += 1;
    hrTotal += mPegawai.hr ?? 0.00;
    jam1Total += mPegawai.jam1 ?? 0.00;
    jam2Total += mPegawai.jam2 ?? 0.00;
    jam1rpTotal += mPegawai.jam1rp ?? 0.00;
    jam2rpTotal += mPegawai.jam2rp ?? 0.00;
    lainTotal += mPegawai.lain ?? 0.00;
    insentifbulananTotal += mPegawai.insentifbulanan ?? 0.00;
    jumlahTotal += mPegawai.jumlah ?? 0.00;
    notifyListeners();
  }

  void hitungSubTotal() {
    sumQty = 0;
    hrTotal = 0;
    jam1Total = 0;
    jam2Total = 0;
    jam1rpTotal = 0;
    jam2rpTotal = 0;
    lainTotal = 0;
    insentifbulananTotal = 0;
    jumlahTotal = 0;
    for (int i = 0; i < data_pegawai_keranjang.length; i++) {
      hrTotal += data_pegawai_keranjang[i].hr ?? 0.00;
      jam1Total += data_pegawai_keranjang[i].jam1 ?? 0.00;
      jam2Total += data_pegawai_keranjang[i].jam2 ?? 0.00;
      jam1rpTotal += data_pegawai_keranjang[i].jam1rp ?? 0.00;
      jam2rpTotal += data_pegawai_keranjang[i].jam2rp ?? 0.00;
      lainTotal += data_pegawai_keranjang[i].lain ?? 0.00;
      insentifbulananTotal += data_pegawai_keranjang[i].insentifbulanan ?? 0.00;
      jumlahTotal += data_pegawai_keranjang[i].jumlah ?? 0.00;
    }
    notifyListeners();
  }

  /// data header
  Future<bool> saveKikJahit() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_pegawai_keranjang.length > 0) {
        BotToast.showLoading();
        var data_ready = await m_order.get_no_bukti(
            no_buktiController.text, "no_bukti", "hrd_absen");
        if (data_ready.length > 0) {
          Toast("Peringatan !",
              "No bukti '${no_buktiController.text}' sudah ada", false);
          BotToast.closeAllLoading();
          return false;
        } else {
          Map obj = new Map();
          obj['no_bukti'] = 'HR' +
              per.substring(2, 4) +
              per.substring(5, 7) +
              '.' +
              per.substring(5, 7) +
              '-' +
              kd_bagController.text;
          obj['kd_bag'] = kd_bagController.text;
          obj['nm_bag'] = nm_bagController.text;
          obj['notes'] = notesController.text;
          obj['tabeld'] = await baca_tabeld();
          await m_order.insert_kik_jahit(obj);
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

  Future<bool> editKikJahit() async {
    hitungSubTotal();
    if (kd_bagController.text.isNotEmpty) {
      if (data_pegawai_keranjang.length > 0) {
        BotToast.showLoading();
        Map obj = new Map();
        obj['no_bukti'] = no_buktiController.text;
        obj['kd_bag'] = kd_bagController.text;
        obj['nm_bag'] = nm_bagController.text;
        obj['notes'] = notesController.text;
        obj['tabeld'] = await baca_tabeld();
        await m_order.update_kik_jahit(obj);
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

  Future<bool> deleteKikJahit(String no_bukti) async {
    try {
      var delete = await m_order.delete_kik_jahit(no_bukti);
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
      double hr = data_pegawai_keranjang[i].hr;
      double jam1 = data_pegawai_keranjang[i].jam1;
      double jam2 = data_pegawai_keranjang[i].jam2;
      double jam1rp = data_pegawai_keranjang[i].jam1rp;
      double jam2rp = data_pegawai_keranjang[i].jam2rp;
      double lain = data_pegawai_keranjang[i].lain;
      double insentifbulanan = data_pegawai_keranjang[i].insentifbulanan;
      double jumlah = data_pegawai_keranjang[i].jumlah;
      Map obj = new Map();
      obj['kd_bag'] = kd_bagController.text;
      obj['kd_peg'] = data_pegawai_keranjang[i].kd_peg;
      obj['nm_peg'] = data_pegawai_keranjang[i].nm_peg;
      obj['ptkp'] = data_pegawai_keranjang[i].ptkp;
      obj['hr'] = hr ?? 0.00;
      obj['jam1'] = jam1 ?? 0.00;
      obj['jam2'] = jam2 ?? 0.00;
      obj['jam1rp'] = jam1rp ?? 0.00;
      obj['jam2rp'] = jam2rp ?? 0.00;
      obj['lain'] = lain ?? 0.00;
      obj['insentifbulanan'] = insentifbulanan ?? 0.00;
      obj['jumlah'] = jumlah ?? 0.00;
      pegawaiList.add(obj);
    }
    return pegawaiList;
  }
}
