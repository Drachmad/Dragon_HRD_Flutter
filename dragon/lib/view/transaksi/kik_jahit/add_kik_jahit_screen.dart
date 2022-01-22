import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dragon/view/transaksi/kik_jahit/widget/pilih_bagian.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/animation_custom_dialog.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/transaksi/kik_jahit_controller.dart';
import 'package:dragon/model/data_pegawai.dart';
import 'package:dragon/view/base_widget/save_success.dart';
import 'package:dragon/view/transaksi/kik_jahit/widget/add_kik_jahit_card.dart';
import 'package:provider/provider.dart';

class AddKikJahitScreen extends StatefulWidget {
  bool isModeEdit;
  var data_edit;
  AddKikJahitScreen(this.isModeEdit, {this.data_edit});

  @override
  _AddKikJahitScreenState createState() => _AddKikJahitScreenState();
}

class _AddKikJahitScreenState extends State<AddKikJahitScreen> {
  GlobalKey<AutoCompleteTextFieldState<DataPegawai>> key = new GlobalKey();
  AutoCompleteTextField searchTextField;

  _AddKikJahitScreenState();

  @override
  void initState() {
    if (widget.isModeEdit) {
      Provider.of<KikJahitController>(context, listen: false)
          .initData_editKikJahit(widget.data_edit);
    } else {
      Provider.of<KikJahitController>(context, listen: false)
          .initData_addKikJahit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KikJahitController>(
        builder: (context, kik_jahitController, child) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
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
                (widget.isModeEdit)
                    ? "Edit Transaksi KikJahit"
                    : "Tambah Transaksi KikJahit",
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
            OnHoverButton(
              child: InkWell(
                onTap: () {
                  if (widget.isModeEdit) {
                    kik_jahitController.editKikJahit().then((value) {
                      if (value != null) {
                        if (value) {
                          Navigator.pop(context, true);
                        }
                      }
                    });
                  } else {
                    kik_jahitController.saveKikJahit().then((value) {
                      if (value != null) {
                        if (value) {
                          showAnimatedDialog_withCallBack(
                              context,
                              SaveSuccess("Success !!",
                                  "Berhasil menyimpan Transaksi KikJahit"),
                              isFlip: true, callback: (value) {
                            if (value != null) {
                              if (value) {
                                kik_jahitController.initData_addKikJahit();
                                kik_jahitController.notifyListeners();
                              } else {
                                kik_jahitController.notifyListeners();
                                Navigator.pop(context, true);
                              }
                            }
                          });
                        }
                      }
                    });
                  }
                },
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/ic_save.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Simpan",
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 24, bottom: 24),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "No Bukti",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        border: Border.all(color: GreyColor),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller: kik_jahitController
                                            .no_buktiController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bagian",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: GreyColor),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller: kik_jahitController
                                            .kd_bagController,
                                        readOnly: widget.isModeEdit,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
                                          icon: Image.asset(
                                            "assets/images/ic_search.png",
                                            height: 20,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        onTap: () {
                                          showAnimatedDialog(
                                              context,
                                              PilihBagian(
                                                  kik_jahitController
                                                          .kd_bagController
                                                          .text
                                                          .isEmpty
                                                      ? null
                                                      : kik_jahitController
                                                          .kd_bagController
                                                          .text,
                                                  kik_jahitController),
                                              isFlip: false);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nama Bagian",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        border: Border.all(color: GreyColor),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller: kik_jahitController
                                            .nm_bagController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Notes",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: GreyColor),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller:
                                            kik_jahitController.notesController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 8),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: searchTextField = AutoCompleteTextField<DataPegawai>(
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        icon: Image.asset(
                          "assets/images/ic_search.png",
                          height: 25,
                        ),
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        filled: true,
                        hintText: "Cari disini",
                        hintStyle: GoogleFonts.poppins(
                            color: GreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      itemSubmitted: (item) {
                        DataPegawai db_item = DataPegawai(
                          noid: item.noid,
                          kd_peg: item.kd_peg,
                          nm_peg: item.nm_peg,
                          ptkp: item.ptkp,
                        );
                        searchTextField.textField.controller.clear();
                        kik_jahitController.addKeranjang(db_item);
                      },
                      submitOnSuggestionTap: true,
                      clearOnSubmit: false,
                      key: key,
                      suggestions: kik_jahitController.pegawaiList,
                      itemBuilder: (context, item) {
                        return Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        item.nm_peg,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        item.kd_peg,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: GreyColor,
                                height: 1,
                              ),
                            ],
                          ),
                        );
                      },
                      itemSorter: (a, b) {
                        return a.kd_peg.compareTo(b.kd_peg);
                      },
                      itemFilter: (item, query) {
                        return item.nm_peg
                            .toLowerCase()
                            .startsWith(query.toLowerCase());
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "No.",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "NIP",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          "Nama",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "PTKP",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "HR",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Jam1",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Jam2",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Jam 1 Rp",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Jam 2 Rp",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Lain",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Insentif Bulan",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Jumlah",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: kik_jahitController.data_pegawai_keranjang.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AddKikJahitCard(context, index,
                        kik_jahitController.data_pegawai_keranjang[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 9,
                child: Text(
                  "TOTAL",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config()
                      .format_rupiah(kik_jahitController.hrTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config()
                      .format_rupiah(kik_jahitController.jam1Total.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config()
                      .format_rupiah(kik_jahitController.jam2Total.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config().format_rupiah(
                      kik_jahitController.jam1rpTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config().format_rupiah(
                      kik_jahitController.jam2rpTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config()
                      .format_rupiah(kik_jahitController.lainTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config().format_rupiah(
                      kik_jahitController.insentifbulananTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  config().format_rupiah(
                      kik_jahitController.jumlahTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 36,
              )
            ],
          ),
        ),
      );
    });
  }
}
