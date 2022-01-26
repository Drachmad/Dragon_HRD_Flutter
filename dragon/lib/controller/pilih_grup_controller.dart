import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dragon/model/data_grup.dart';

class PilihGrupController with ChangeNotifier {
  List data_grupList = [];

  model_data_grup m_dataGrup = model_data_grup();

  Future<void> initData(String cari) async {
    data_grupList = await m_dataGrup.data_grup(cari);
    notifyListeners();
  }
}
