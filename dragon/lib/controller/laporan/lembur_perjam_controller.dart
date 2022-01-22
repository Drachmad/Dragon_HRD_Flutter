import 'package:flutter/material.dart';
import 'package:dragon/config/config.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:dragon/config/export_pdf.dart';
import 'package:dragon/model/laporan/model_laporan.dart';

class LemburPerjamController with ChangeNotifier {
  model_laporan m_data = model_laporan();
  List data_list = [];
  bool isEnable_button = true;
  int index_terpilih;
  DateTime chooseDate = DateTime.now();
  TextEditingController tglController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();

  Future<void> select_data(String KD_BAG, String TGL) async {
    data_list = await m_data.lap_lembur_perjam(KD_BAG, TGL);
    notifyListeners();
  }

  void initData() {
    index_terpilih = null;
    tglController.clear();
    kd_bagController.clear();
    select_data('', '');
  }

  Future<void> proses_export_lembur_perjam(int mode) async {
    if (data_list.length > 0) {
      BotToast.showLoading();
      List header_excel = [];
      List isi_excel = [];
      header_excel.add("No Bukti");
      header_excel.add("Nama Pegawai");
      header_excel.add("Bagian");
      header_excel.add("Tanggal");
      header_excel.add("U Lembur");
      for (int i = 0; i < data_list.length; i++) {
        Map<String, dynamic> isi_map = <String, dynamic>{};
        isi_map['a'] = data_list[i]['NO_BUKTI'];
        isi_map['b'] = data_list[i]['NM_PEG'];
        isi_map['c'] = data_list[i]['BAGIAN'];
        isi_map['d'] = data_list[i]['TGL'];
        isi_map['e'] = data_list[i]['ULEMBUR'];
        isi_excel.add(isi_map);
      }
      String judul = "Laporan Lembur Per Jam";
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
