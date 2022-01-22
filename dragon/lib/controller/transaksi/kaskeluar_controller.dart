import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/model/model_account.dart';
import 'package:dragon/model/data_account.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/model/transaksi/model_kaskeluar.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class KaskeluarController with ChangeNotifier {
  model_kaskeluar m_order = model_kaskeluar();
  TextEditingController searchController = TextEditingController();
  DateRangePickerController filter_tanggalController =
      new DateRangePickerController();
  List data_order_penjualan_list = [];
  bool isEnable_button = true;
  String selectedDate = '';
  String dateCount = '';
  String range = 'Pilih tanggal';
  String rangeCount = '';
  String tanggal_awal = "";
  String tanggal_akhir = "";
  int index_terpilih;

  Future<void> select_data() async {
    data_order_penjualan_list = await m_order.select_kaskeluar(
        searchController.text, tanggal_awal, tanggal_akhir);
    notifyListeners();
  }

  void initData() {
    index_terpilih = null;
    tanggal_awal =
        DateFormat('yyyy-MM-dd', "id_ID").format(DateTime.now()).toString();
    tanggal_akhir =
        DateFormat('yyyy-MM-dd', "id_ID").format(DateTime.now()).toString();
    range =
        DateFormat('dd/MM/yyyy', "id_ID").format(DateTime.now()).toString() +
            ' - ' +
            DateFormat('dd/MM/yyyy', "id_ID").format(DateTime.now()).toString();
    select_data();
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

  void proses_export() {
    if (data_order_penjualan_list.length > 0) {
      BotToast.showLoading();
      List header_excel = new List();
      List isi_excel = new List();
      header_excel.add("Tanggal");
      header_excel.add("No bukti");
      header_excel.add("Sales");
      header_excel.add("Customer");
      header_excel.add("keterangan");
      header_excel.add("Qty");
      header_excel.add("Total");
      header_excel.add("Status");
      for (int i = 0; i < data_order_penjualan_list.length; i++) {
        Map<String, dynamic> isi_map = new Map<String, dynamic>();
        isi_map['a'] = data_order_penjualan_list[i]['tanggal'];
        isi_map['b'] = data_order_penjualan_list[i]['no_bukti'];
        isi_map['c'] = data_order_penjualan_list[i]['sales'];
        isi_map['d'] = data_order_penjualan_list[i]['customer'];
        isi_map['e'] = data_order_penjualan_list[i]['keterangan'];
        isi_map['f'] = data_order_penjualan_list[i]['total_qty'];
        isi_map['g'] = data_order_penjualan_list[i]['total_so'];
        if (data_order_penjualan_list[i]['status'] == 1) {
          isi_map['h'] = "Diterima";
        } else {
          isi_map['h'] = "Belum Diterima";
        }
        isi_excel.add(isi_map);
      }
      String judul = "Laporan Order Penjualan (${range.replaceAll("/", "")})";
      config().createExcel(header_excel, isi_excel, judul);
    } else {
      Toast("Tidak ada data untuk di export", "", false);
    }
  }

  Future<void> proses_export_detail() async {
    if (index_terpilih != null) {
      BotToast.showLoading();
      List header_excel = new List();
      List header_detail_excel = new List();
      List isi_excel = new List();
      List isi_detail_excel = new List();
      List footer_excel = new List();
      header_excel.add("Tanggal");
      header_excel.add("No bukti");
      header_excel.add("Sales");
      header_excel.add("Customer");
      header_excel.add("keterangan");
      header_excel.add("Status");
      Map<String, dynamic> map_transaksi = new Map<String, dynamic>();
      map_transaksi['a'] = data_order_penjualan_list[index_terpilih]['tanggal'];
      map_transaksi['b'] =
          data_order_penjualan_list[index_terpilih]['no_bukti'];
      map_transaksi['c'] = data_order_penjualan_list[index_terpilih]['sales'];
      map_transaksi['d'] =
          data_order_penjualan_list[index_terpilih]['customer'];
      map_transaksi['e'] =
          data_order_penjualan_list[index_terpilih]['keterangan'];
      if (data_order_penjualan_list[index_terpilih]['status'] == 1) {
        map_transaksi['f'] = "Diterima";
      } else {
        map_transaksi['f'] = "Belum Diterima";
      }
      isi_excel.add(map_transaksi);

      header_detail_excel.add("Kode Barang");
      header_detail_excel.add("Nama Barang");
      header_detail_excel.add("Satuan");
      header_detail_excel.add("Qty");
      header_detail_excel.add("Harga");
      header_detail_excel.add("SubTotal");
      List data_account = await m_order.select_kaskeluar_detail(
          data_order_penjualan_list[index_terpilih]['no_bukti'],
          "NO_BUKTI",
          "kas");
      for (int i = 0; i < data_account.length; i++) {
        Map<String, dynamic> isi_map = new Map<String, dynamic>();
        isi_map['a'] = data_account[i]['kode_barang'];
        isi_map['b'] = data_account[i]['nama_barang'];
        isi_map['c'] = data_account[i]['satuan'];
        isi_map['d'] = data_account[i]['qty'];
        isi_map['e'] = data_account[i]['harga_so'];
        isi_map['f'] = data_account[i]['sub_total'];
        isi_detail_excel.add(isi_map);
      }
      footer_excel.add("");
      footer_excel.add("");
      footer_excel.add("Jumlah");
      footer_excel.add(data_order_penjualan_list[index_terpilih]['total_qty']);
      footer_excel.add("Total");
      footer_excel.add(data_order_penjualan_list[index_terpilih]['total_so']);
      String judul =
          "Invoice Order Penjualan (${data_order_penjualan_list[index_terpilih]['no_bukti']})";
      config().createExcel2(header_excel, header_detail_excel, isi_excel,
          isi_detail_excel, footer_excel, judul);
    } else {
      Toast("Silahkan pilih 1 invoice untuk di download !", "", false);
    }
  }

  Future<void> proses_print() async {
    List data_account = await m_order.select_kaskeluar_detail(
        data_order_penjualan_list[index_terpilih]['no_bukti'],
        "NO_BUKTI",
        "kas");
    // InvoiceOrderPenjualan()
    //     .proses_print(data_order_penjualan_list[index_terpilih], data_account);
  }

  //add order pembelian
  TextEditingController nobuktiController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController bacnoController = TextEditingController();
  TextEditingController bnamaController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  final format_tanggal = new DateFormat("d-M-y");
  final format_created_at = DateFormat("yyyy-MM-dd hh:mm:ss", "id_ID");
  final format_created_at2 = DateFormat("yyyy-MM", "id_ID");
  final format_no_bukti = DateFormat("yyMM", "id_ID");
  DateTime chooseDate = DateTime.now();
  String tanggal;
  List<DataAccount> data_account_keranjang = List<DataAccount>();
  double sumQty = 0;
  double sumTotal = 0;
  String uraian, reff;
  int no_urut = 0;
  List<DataAccount> accountList = List<DataAccount>();
  bool status_kaskeluar = true;

  Future<void> initData_addKaskeluar() async {
    data_account_keranjang = new List<DataAccount>();
    nobuktiController.clear();
    bacnoController.clear();
    bnamaController.clear();
    keteranganController.clear();
    tanggalController.text = format_tanggal.format(chooseDate);
    sumQty = 0;
    sumTotal = 0;
    await m_order
        .countKasKeluar(format_created_at2.format(DateTime.now()))
        .then((value) {
      if (value != null) {
        if (value.length > 0) {
          no_urut = value.length;
        } else {
          no_urut = 0;
        }
        nobuktiController.text =
            "BKK${format_no_bukti.format(DateTime.now())}B-${no_urut + 1}";
      }
    });
    await model_account().data_account().then((value) {
      if (value != null) {
        accountList.clear();
        for (int i = 0; i < value.length; i++) {
          accountList.add(DataAccount.fromJson(value[i]));
        }
      }
    });
  }

  Future<void> initData_editKaskeluar(var data_edit) async {
    nobuktiController.text = data_edit['NO_BUKTI'];
    chooseDate = DateTime.parse(data_edit['TGL']);
    tanggalController.text = format_tanggal.format(chooseDate);
    bacnoController.text = data_edit['BACNO'];
    bnamaController.text = data_edit['BNAMA'];
    keteranganController.text = data_edit['KET'];
    // chooseDate = DateFormat("yyyy-MM-dd").parse(data_edit['TGL']);
    // status_kaskeluar = data_edit['POSTED'] == 1 ? true : false;
    List data_lama = await m_order.select_kaskeluar_detail(
        data_edit['NO_BUKTI'], "NO_BUKTI", "kasd");
    data_account_keranjang = new List<DataAccount>();

    for (int i = 0; i < data_lama.length; i++) {
      DataAccount mAccount = DataAccount(
        noid: data_lama[i]['NO_ID'],
        acno: data_lama[i]['ACNO'],
        nacno: data_lama[i]['NACNO'],
        reff: data_lama[i]['URAIAN'],
        jumlah: double.parse(data_lama[i]['JUMLAH'].toString()) ?? 0.00,
      );
      data_account_keranjang.add(mAccount);
    }
    hitungSubTotal();
    await model_account().data_account().then((value) {
      if (value != null) {
        accountList.clear();
        for (int i = 0; i < value.length; i++) {
          accountList.add(DataAccount.fromJson(value[i]));
        }
      }
    });
  }

  void addKeranjang(DataAccount mAccount) {
    // m_barang.stok_booking = 1;
    data_account_keranjang.add(mAccount);
    sumQty += 1;
    sumTotal += mAccount.jumlah ?? 0.00;
    notifyListeners();
  }

  void hitungSubTotal() {
    sumQty = 0;
    sumTotal = 0;
    for (int i = 0; i < data_account_keranjang.length; i++) {
      // sumQty += data_account_keranjang[i].stok_booking;
      // sumTotal += data_account_keranjang[i].harga_beli *
      //     data_account_keranjang[i].stok_booking;
      sumTotal += data_account_keranjang[i].jumlah ?? 0.00;
    }
    notifyListeners();
  }

  /// data header
  Future<bool> saveKaskeluar() async {
    hitungSubTotal();
    if (nobuktiController.text.isNotEmpty) {
      if (data_account_keranjang.length > 0) {
        BotToast.showLoading();
        var data_ready = await m_order.get_no_bukti(
            nobuktiController.text, "NO_BUKTI", "kas");
        if (data_ready.length > 0) {
          Toast("Peringatan !",
              "No bukti '${nobuktiController.text}' sudah ada", false);
          BotToast.closeAllLoading();
          return false;
        } else {
          Map obj = new Map();
          obj['tanggal'] = DateFormat("yyyy-MM-dd").format(chooseDate);
          obj['no_bukti'] = nobuktiController.text;
          obj['bacno'] = bacnoController.text;
          obj['nama'] = bnamaController.text;
          obj['sumjumlah'] = sumTotal;
          obj['keterangan'] = keteranganController.text;
          obj['tabeld'] = await baca_tabeld();
          await m_order.insert_kaskeluar(obj);
          BotToast.closeAllLoading();
          return true;
        }
      } else {
        Toast("Peringatan !", "Belum ada detil Transaksi yang di input", false);
        return false;
      }
    } else {
      Toast("Peringatan !", "No. bukti wajib di isi !", false);
      return false;
    }
  }

  Future<bool> editKaskeluar() async {
    hitungSubTotal();
    if (nobuktiController.text.isNotEmpty) {
      if (data_account_keranjang.length > 0) {
        BotToast.showLoading();
        Map obj = new Map();
        obj['tanggal'] = DateFormat("yyyy-MM-dd").format(chooseDate);
        obj['no_bukti'] = nobuktiController.text;
        obj['bacno'] = bacnoController.text;
        obj['nama'] = bnamaController.text;
        obj['sumjumlah'] = sumTotal;
        obj['keterangan'] = keteranganController.text;
        obj['tabeld'] = await baca_tabeld();
        await m_order.update_kaskeluar(obj);
        BotToast.closeAllLoading();
        Toast("Success !", "Berhasil mengedit data", true);
        return true;
      } else {
        Toast("Peringatan !", "Belum ada detil Transaksi yang di input", false);
        return false;
      }
    } else {
      Toast("Peringatan !", "No. bukti wajib di isi !", false);
      return false;
    }
  }

  Future<bool> deleteKaskeluar(String no_bukti) async {
    try {
      var delete = await m_order.delete_kaskeluar(no_bukti);
      await select_data();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// data detail
  Future<List> baca_tabeld() async {
    List accountList = [];
    for (int i = 0; i < data_account_keranjang.length; i++) {
      double jumlah = data_account_keranjang[i].jumlah;
      double subTotal = jumlah;
      Map obj = new Map();
      obj['acno'] = data_account_keranjang[i].acno;
      obj['nacno'] = data_account_keranjang[i].nacno;
      obj['uraian'] = data_account_keranjang[i].reff;
      obj['jumlah'] = jumlah ?? 0.00;
      // obj['sub_total'] = subTotal ?? 0.00;
      accountList.add(obj);
    }
    return accountList;
  }
}
