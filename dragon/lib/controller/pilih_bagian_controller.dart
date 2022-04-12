import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dragon/model/data_bagian.dart';

class PilihBagianController with ChangeNotifier {
  List data_bagianList = [];

  DataBagian m_dataBagian = DataBagian();

  Future<void> initData(String cari) async {
    data_bagianList = await m_dataBagian.data_bagian(cari);
    notifyListeners();
  }
}
