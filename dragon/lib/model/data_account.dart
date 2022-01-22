import 'dart:convert';

import 'package:flutter/services.dart';

class DataAccount {
  int noid;
  String acno;
  String nacno;
  String reff;
  double jumlah;

  DataAccount({
    this.noid,
    this.acno,
    this.nacno,
    this.reff,
    this.jumlah,
  });

  factory DataAccount.fromJson(var parsedJson) {
    return DataAccount(
      noid: parsedJson['NO_ID'],
      acno: parsedJson['ACNO'] as String,
      nacno: parsedJson['NAMA'] as String,
      reff: parsedJson['URAIAN'] as String ?? "",
      jumlah: parsedJson['JUMLAH'] ?? 0.00,
    );
  }
}

class AccountViewModel {
  static List<DataAccount> accountList;

  static Future loadAccount() async {
    try {
      accountList = List<DataAccount>();
      String jsonString =
          await rootBundle.loadString('assets/file/account.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['account'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        accountList.add(DataAccount.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
