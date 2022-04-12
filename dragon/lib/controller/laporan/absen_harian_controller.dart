import 'package:flutter/material.dart';
import 'package:dragon/config/config.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:dragon/config/export_pdf.dart';
import 'package:dragon/model/laporan/model_laporan.dart';

class AbsenHarianController with ChangeNotifier {
  model_laporan m_data = model_laporan();
  List data_list = [];
  bool isEnable_button = true;
  String PER = DateTime.now().toString().substring(0, 7);
  int index_terpilih;
  String paramKD_BAG = '';

  Future<void> select_data(String KD_BAG) async {
    paramKD_BAG = KD_BAG;
    data_list = await m_data.lap_absen_harian(KD_BAG, PER);
    notifyListeners();
  }

  void initData() {
    index_terpilih = null;
    select_data('');
  }

  Future<void> print() async {
    await m_data.print_data(paramKD_BAG, PER);
    notifyListeners();
  }

  Future<void> proses_export_absen_harian(int mode) async {
    if (data_list.length > 0) {
      BotToast.showLoading();
      List header_excel = [];
      List isi_excel = [];
      header_excel.add("Periode");
      header_excel.add("Nama Pegawai");
      header_excel.add("Kode Pegawai");
      header_excel.add("Status");
      header_excel.add("Bagian");
      for (int i = 0; i < data_list.length; i++) {
        Map<String, dynamic> isi_map = <String, dynamic>{};
        isi_map['a'] = data_list[i]['PER'];
        isi_map['b'] = data_list[i]['NM_PEG'];
        isi_map['c'] = data_list[i]['KD_PEG'];
        isi_map['d'] = data_list[i]['AKTIF'];
        isi_map['e'] = data_list[i]['BAGIAN'];
        isi_excel.add(isi_map);
      }
      String judul = "Laporan Absen Harian";
      String header_title = "";
      if (mode == 0) {
        config().createExcel3(header_excel, isi_excel, header_title, judul);
      } else {
        ExportPDF(header_excel, isi_excel, judul);
      }
    } else {
      Toast("Tidak ada data untuk di export", "", false);
    }
  }
}
