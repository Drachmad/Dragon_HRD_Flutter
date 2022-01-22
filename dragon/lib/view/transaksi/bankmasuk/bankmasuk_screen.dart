import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/animation_custom_dialog.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/login_controller.dart';
import 'package:dragon/controller/transaksi/bankmasuk_controller.dart';
import 'package:dragon/view/base_widget/mode_export.dart';
import 'package:dragon/view/base_widget/notif_hapus.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:dragon/view/transaksi/bankmasuk/add_bankmasuk_screen.dart';
import 'package:dragon/view/transaksi/bankmasuk/widget/bankmasuk_card.dart';
import 'package:provider/provider.dart';

import 'widget/filter_tanggal.dart';

class BankMasukScreen extends StatefulWidget {
  @override
  _BankMasukScreenState createState() => _BankMasukScreenState();
}

class _BankMasukScreenState extends State<BankMasukScreen> {
  @override
  void initState() {
    Provider.of<BankmasukController>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BankmasukController>(
        builder: (context, bankmasukController, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              Container(
                height: 25,
                width: 1,
                color: AbuColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Bank Masuk",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 20,
            padding: EdgeInsets.all(0),
            icon: Image.asset(
              "assets/images/ic_back.png",
              height: 30,
            ),
          ),
          actions: [
            if (Provider.of<LoginController>(context, listen: false).ROLE == 1)
              OnHoverButton(
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddBankMasukScreen(false)))
                        .then((value) {
                      if (value != null) {
                        if (value) {
                          bankmasukController.select_data();
                        }
                      }
                    });
                  },
                  child: Container(
                    height: 30,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/ic_add.png",
                          height: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Tambah Baru",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(
              width: 16,
            ),
            OnHoverButton(
              child: InkWell(
                hoverColor: Colors.white,
                onTap: () {
                  showAnimatedDialog_withCallBack(context, ModeExport(1),
                      isFlip: true, callback: (value) {
                    if (value != null) {
                      if (value == 1) {
                        bankmasukController.proses_export_detail();
                      } else if (value == 2) {
                        bankmasukController.proses_export();
                      }
                    }
                  });
                },
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/ic_download.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Export",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            OnHoverButton(
              child: InkWell(
                hoverColor: Colors.white,
                onTap: () {
                  if (bankmasukController.index_terpilih != null) {
                    bankmasukController.proses_print();
                  } else {
                    Toast(
                        "Peringatan",
                        "Silahkan pilih satu transaksi untuk di cetak !",
                        false);
                  }
                },
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/ic_print.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Cetak Invoice",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        backgroundColor: kBackgroundColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 16, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: GreyColor,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset:
                                  Offset(1, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/ic_search.png",
                              height: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 1,
                                height: 25,
                                color: GreyColor,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                child: TextField(
                                  controller:
                                      bankmasukController.searchController,
                                  decoration: InputDecoration(
                                    hintText: "Cari Disini",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: GreyColor),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 14),
                                    border: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    bankmasukController.select_data();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          showAnimatedDialog_withCallBack(
                              context, FilterTanggal(), isFlip: true,
                              callback: (value) {
                            if (value != null) {
                              if (value) {
                                bankmasukController.select_data();
                                bankmasukController.notifyListeners();
                              } else {
                                bankmasukController.notifyListeners();
                                Navigator.pop(context, true);
                              }
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: GreyColor,
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(1, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/ic_tanggal.png",
                                height: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 1,
                                  height: 25,
                                  color: GreyColor,
                                ),
                              ),
                              Text(
                                bankmasukController.range,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: (bankmasukController.data_order_penjualan_list.length >
                        0)
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 24),
                        itemCount: bankmasukController
                            .data_order_penjualan_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderPenjualanCard(index, pressEdit: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddBankMasukScreen(
                                          true,
                                          data_edit: bankmasukController
                                              .data_order_penjualan_list[index],
                                        ))).then((value) {
                              if (value != null) {
                                if (value) {
                                  bankmasukController.select_data();
                                }
                              }
                            });
                          }, pressDelete: () {
                            showAnimatedDialog_withCallBack(
                                context, NotifHapus(), isFlip: true,
                                callback: (value) {
                              if (value != null) {
                                if (value) {
                                  bankmasukController
                                      .deleteBankmasuk(bankmasukController
                                              .data_order_penjualan_list[index]
                                          ['NO_BUKTI'])
                                      .then((value) {
                                    if (value) {
                                      Toast("Delete Success !",
                                          "Berhasil menghapus data", true);
                                    } else {
                                      Toast("Delete Failed !",
                                          "Gagal menghapus data", false);
                                    }
                                    bankmasukController.notifyListeners();
                                  });
                                }
                              }
                            });
                          });
                        })
                    : Container(
                        child: Center(
                          child: Text(
                            "Tidak ada data",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: GreyColor),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
