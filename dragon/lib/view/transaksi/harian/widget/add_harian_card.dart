import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/transaksi/harian_controller.dart';
import 'package:dragon/model/data_pegawai.dart';
import 'package:provider/provider.dart';

Widget AddHarianCard(
    BuildContext context, int index, DataPegawai data_pegawai) {
  TextEditingController kd_pegController = new TextEditingController();
  TextEditingController nm_pegController = new TextEditingController();
  TextEditingController ptkpController = new TextEditingController();
  TextEditingController hrController = new TextEditingController();
  TextEditingController jam1Controller = new TextEditingController();
  TextEditingController jam2Controller = new TextEditingController();
  TextEditingController jam1rpController = new TextEditingController();
  TextEditingController jam2rpController = new TextEditingController();
  TextEditingController lainController = new TextEditingController();
  TextEditingController insentifbulananController = new TextEditingController();
  // TextEditingController jumlahController = new TextEditingController();
  double jumlah = data_pegawai.lain;
  kd_pegController.value = TextEditingValue(
    text: data_pegawai.kd_peg.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_pegawai.kd_peg.toString().length),
    ),
  );
  nm_pegController.value = TextEditingValue(
    text: data_pegawai.nm_peg.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_pegawai.nm_peg.toString().length),
    ),
  );
  ptkpController.value = TextEditingValue(
    text: data_pegawai.ptkp ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_pegawai.ptkp.toString().length),
    ),
  );
  hrController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.hr.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_pegawai.hr.toString()).length),
    ),
  );
  jam1Controller.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.jam1.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_pegawai.jam1.toString()).length),
    ),
  );
  jam2Controller.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.jam2.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_pegawai.jam2.toString()).length),
    ),
  );
  jam1rpController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.jam1rp.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset:
              config().format_rupiah(data_pegawai.jam1rp.toString()).length),
    ),
  );
  jam2rpController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.jam2rp.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset:
              config().format_rupiah(data_pegawai.jam2rp.toString()).length),
    ),
  );
  lainController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.lain.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_pegawai.lain.toString()).length),
    ),
  );
  insentifbulananController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.insentifbulanan.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config()
              .format_rupiah(data_pegawai.insentifbulanan.toString())
              .length),
    ),
  );
  // jumlahController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.jumlah.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset:
  //             config().format_rupiah(data_pegawai.jumlah.toString()).length),
  //   ),
  // );
  var harianController = Provider.of<HarianController>(context, listen: false);

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "${index + 1}.",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_pegawai.kd_peg ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_pegawai.nm_peg ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_pegawai.ptkp ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: hrController,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        hrController.value = TextEditingValue(
                          text: config().format_rupiah(hrController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(hrController.text)
                                    .length),
                          ),
                        );
                        harianController.data_pegawai_keranjang[index].hr =
                            config().convert_rupiah(hrController.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController.data_pegawai_keranjang[index].hr =
                          config().convert_rupiah(hrController.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: jam1Controller,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        jam1Controller.value = TextEditingValue(
                          text: config().format_rupiah(jam1Controller.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(jam1Controller.text)
                                    .length),
                          ),
                        );
                        harianController.data_pegawai_keranjang[index].jam1 =
                            config().convert_rupiah(jam1Controller.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController.data_pegawai_keranjang[index].jam1 =
                          config().convert_rupiah(jam1Controller.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: jam2Controller,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        jam2Controller.value = TextEditingValue(
                          text: config().format_rupiah(jam2Controller.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(jam2Controller.text)
                                    .length),
                          ),
                        );
                        harianController.data_pegawai_keranjang[index].jam2 =
                            config().convert_rupiah(jam2Controller.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController.data_pegawai_keranjang[index].jam2 =
                          config().convert_rupiah(jam2Controller.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: jam1rpController,
                    readOnly: true,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        jam1rpController.value = TextEditingValue(
                          text: config().format_rupiah(jam1rpController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(jam1rpController.text)
                                    .length),
                          ),
                        );
                        harianController.data_pegawai_keranjang[index].jam1rp =
                            config().convert_rupiah(jam1rpController.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController.data_pegawai_keranjang[index].jam1rp =
                          config().convert_rupiah(jam1rpController.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    readOnly: true,
                    controller: jam2rpController,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        jam2rpController.value = TextEditingValue(
                          text: config().format_rupiah(jam2rpController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(jam2rpController.text)
                                    .length),
                          ),
                        );
                        harianController.data_pegawai_keranjang[index].jam2rp =
                            config().convert_rupiah(jam2rpController.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController.data_pegawai_keranjang[index].jam2rp =
                          config().convert_rupiah(jam2rpController.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: lainController,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        lainController.value = TextEditingValue(
                          text: config().format_rupiah(lainController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(lainController.text)
                                    .length),
                          ),
                        );
                        harianController.data_pegawai_keranjang[index].lain =
                            config().convert_rupiah(lainController.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController.data_pegawai_keranjang[index].lain =
                          config().convert_rupiah(lainController.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    readOnly: true,
                    controller: insentifbulananController,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        insentifbulananController.value = TextEditingValue(
                          text: config()
                              .format_rupiah(insentifbulananController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(
                                        insentifbulananController.text)
                                    .length),
                          ),
                        );
                        harianController
                                .data_pegawai_keranjang[index].insentifbulanan =
                            config()
                                .convert_rupiah(insentifbulananController.text);
                        harianController.hitungSubTotal();
                        harianController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      harianController
                              .data_pegawai_keranjang[index].insentifbulanan =
                          config()
                              .convert_rupiah(insentifbulananController.text);
                      harianController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              config().format_rupiah(jumlah.toString()),
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {
              harianController.data_pegawai_keranjang.removeAt(index);
              harianController.hitungSubTotal();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                "assets/images/ic_hapus.png",
                height: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
