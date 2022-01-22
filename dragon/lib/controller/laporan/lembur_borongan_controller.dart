import 'package:flutter/material.dart';
import 'package:dragon/config/config.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:dragon/config/export_pdf.dart';
import 'package:dragon/model/laporan/model_laporan.dart';

class LemburBoronganController with ChangeNotifier {
  model_laporan m_data = model_laporan();
  List data_list = [];
  bool isEnable_button = true;
  int index_terpilih;
  DateTime chooseDate = DateTime.now();
  TextEditingController tglController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();

  Future<void> select_data(String KDBAG, String TGL) async {
    data_list = await m_data.lap_lembur_borongan(KDBAG, TGL);
    notifyListeners();
  }

  void initData() {
    index_terpilih = null;
    tglController.clear();
    kd_bagController.clear();
    select_data('', '');
  }

  Future<void> proses_export_lembur_borongan(int mode) async {
    if (data_list.length > 0) {
      BotToast.showLoading();
      List headerExcel = [];
      List isiExcel = [];
      headerExcel.add("No Bukti");
      headerExcel.add("Nama Pegawai");
      headerExcel.add("Bagian");
      headerExcel.add("Tanggal");
      headerExcel.add("U Lembur");
      for (int i = 0; i < data_list.length; i++) {
        Map<String, dynamic> isiMap = <String, dynamic>{};
        isiMap['a'] = data_list[i]['NO_BUKTI'];
        isiMap['b'] = data_list[i]['NM_PEG'];
        isiMap['c'] = data_list[i]['BAGIAN'];
        isiMap['d'] = data_list[i]['TGL'];
        isiMap['e'] = data_list[i]['ULEMBUR'];
        isiExcel.add(isiMap);
      }
      String judul = "Laporan Lembur Borongan";
      String headerTitle = "";
      if (mode == 0) {
        config().createExcel3(headerExcel, isiExcel, headerTitle, judul);
      } else {
        ExportPDF(headerExcel, isiExcel, judul);
      }
    } else {
      Toast("Tidak ada data untuk di export", "", false);
    }
  }
}
