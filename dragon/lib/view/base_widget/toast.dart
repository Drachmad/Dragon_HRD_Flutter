import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:dragon/config/color.dart';

Toast(String judul, String keterangan, bool valid) {
  if (valid) {
    BotToast.showSimpleNotification(
        title: judul,
        titleStyle: TextStyle(color: Colors.white),
        backgroundColor: HijauColor,
        duration: Duration(seconds: 3),
        subTitle: keterangan,
        subTitleStyle: TextStyle(color: Colors.white));
  } else {
    BotToast.showSimpleNotification(
        title: judul,
        titleStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
        subTitle: keterangan,
        subTitleStyle: TextStyle(color: Colors.white));
  }
}
