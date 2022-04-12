import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dragon/model/model_login.dart';
import 'package:dragon/view/base_widget/toast.dart';

class LoginController with ChangeNotifier {
  bool mode_login = true;
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  String nama_staff = "";
  String email_staff = "";
  String dr = "";
  int ROLE;

  void initData() async {
    mode_login = true;
    usernameLogin.clear();
    passwordLogin.clear();
  }

  Future<bool> getLogin() async {
    try {
      if (usernameLogin.text.isNotEmpty) {
        if (passwordLogin.text.isNotEmpty) {
          BotToast.showLoading();
          List data_user = await model_login()
              .select_data_login(usernameLogin.text, passwordLogin.text);
          if (data_user.length > 0) {
            var obj_data = data_user[0];
            nama_staff = obj_data['USERNAME'].toString();
            email_staff = obj_data['EMAIL'].toString();
            ROLE = obj_data['ROLE'];
            dr = obj_data['DR'];
            BotToast.closeAllLoading();
            return true;
          } else {
            Toast(
                "Login Gagal !", "Username atau password tidak sesuai", false);
            BotToast.closeAllLoading();
            return false;
          }
        } else {
          Toast("Peringatan", "Silahkan isi password Anda !", false);
          BotToast.closeAllLoading();
          return false;
        }
      } else {
        Toast("Peringatan", "Silahkan isi username Anda !", false);
        BotToast.closeAllLoading();
        return false;
      }
    } catch (e) {
      // Toast("Peringatan", "Silahkan Perikasa Konfigurasi Database anda", false);
      Toast("Peringatan", e.toString(), false);
      BotToast.closeAllLoading();
      return false;
    }
  }

  //variable setting connection
  TextEditingController hostController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController dbNameController = TextEditingController();
}
