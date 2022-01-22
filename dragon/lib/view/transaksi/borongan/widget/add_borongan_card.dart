import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/transaksi/borongan_controller.dart';
import 'package:dragon/model/data_pegawai.dart';
import 'package:provider/provider.dart';

Widget AddBoronganCard(
    BuildContext context, int index, DataPegawai data_pegawai) {
  TextEditingController kd_pegController = new TextEditingController();
  TextEditingController nm_pegController = new TextEditingController();
  TextEditingController ptkpController = new TextEditingController();
  TextEditingController stController = new TextEditingController();
  TextEditingController msController = new TextEditingController();
  TextEditingController hrController = new TextEditingController();
  TextEditingController ikController = new TextEditingController();
  TextEditingController nbController = new TextEditingController();
  TextEditingController upahController = new TextEditingController();
  TextEditingController bonController = new TextEditingController();
  TextEditingController subsidiController = new TextEditingController();
  TextEditingController subController = new TextEditingController();
  TextEditingController harianController = new TextEditingController();
  TextEditingController lainController = new TextEditingController();
  TextEditingController jumlahController = new TextEditingController();
  double subTotal = data_pegawai.jumlah;
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
  // stController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.st.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.st.toString()).length),
  //   ),
  // );
  // msController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.ms.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.ms.toString()).length),
  //   ),
  // );
  // ikController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.ik.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.ik.toString()).length),
  //   ),
  // );
  // nbController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.nb.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.nb.toString()).length),
  //   ),
  // );
  // hrController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.hr.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.hr.toString()).length),
  //   ),
  // );
  // upahController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.upah.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.upah.toString()).length),
  //   ),
  // );
  // bonController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.bon.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.bon.toString()).length),
  //   ),
  // );
  // subsidiController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.subsidi.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset:
  //             config().format_rupiah(data_pegawai.subsidi.toString()).length),
  //   ),
  // );
  // subController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.sub.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset: config().format_rupiah(data_pegawai.sub.toString()).length),
  //   ),
  // );
  // harianController.value = TextEditingValue(
  //   text: config().format_rupiah(data_pegawai.harian.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset:
  //             config().format_rupiah(data_pegawai.harian.toString()).length),
  //   ),
  // );
  lainController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.lain.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_pegawai.lain.toString()).length),
    ),
  );
  jumlahController.value = TextEditingValue(
    text: config().format_rupiah(data_pegawai.jumlah.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset:
              config().format_rupiah(data_pegawai.jumlah.toString()).length),
    ),
  );
  var boronganController =
      Provider.of<BoronganController>(context, listen: false);

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
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            // kd_peg
            flex: 3,
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
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   // nm_peg
          //   flex: 4,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       height: 50,
          //       alignment: Alignment.centerLeft,
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: Text(
          //           data_pegawai.nm_peg ?? "",
          //           style: GoogleFonts.poppins(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.black),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // ptkp
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       height: 50,
          //       alignment: Alignment.centerLeft,
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: Text(
          //           data_pegawai.ptkp ?? "",
          //           style: GoogleFonts.poppins(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.black),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // st
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       height: 50,
          //       alignment: Alignment.centerLeft,
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: Text(
          //           data_pegawai.st ?? "",
          //           style: GoogleFonts.poppins(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.black),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // ms
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           textAlign: TextAlign.left,
          //           readOnly: true,
          //           controller: msController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               msController.value = TextEditingValue(
          //                 text: config().format_rupiah(msController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(msController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController.data_pegawai_keranjang[index].ms =
          //                   config().convert_rupiah(msController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].ms =
          //                 config().convert_rupiah(msController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // IK
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           controller: ikController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               ikController.value = TextEditingValue(
          //                 text: config().format_rupiah(ikController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(ikController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController.data_pegawai_keranjang[index].ik =
          //                   config().convert_rupiah(ikController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].ik =
          //                 config().convert_rupiah(ikController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // NB
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           controller: nbController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               nbController.value = TextEditingValue(
          //                 text: config().format_rupiah(nbController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(nbController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController.data_pegawai_keranjang[index].nb =
          //                   config().convert_rupiah(nbController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].nb =
          //                 config().convert_rupiah(nbController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // hr
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           controller: hrController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 5, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               hrController.value = TextEditingValue(
          //                 text: config().format_rupiah(hrController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(hrController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController.data_pegawai_keranjang[index].hr =
          //                   config().convert_rupiah(hrController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].hr =
          //                 config().convert_rupiah(hrController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // Upah
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           readOnly: true,
          //           controller: upahController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               upahController.value = TextEditingValue(
          //                 text: config().format_rupiah(upahController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(upahController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController.data_pegawai_keranjang[index].upah =
          //                   config().convert_rupiah(upahController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].upah =
          //                 config().convert_rupiah(upahController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // Bon
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           readOnly: true,
          //           controller: bonController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               bonController.value = TextEditingValue(
          //                 text: config().format_rupiah(bonController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(bonController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController.data_pegawai_keranjang[index].bon =
          //                   config().convert_rupiah(bonController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].bon =
          //                 config().convert_rupiah(bonController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // Subsidi
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           readOnly: true,
          //           controller: subsidiController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               subsidiController.value = TextEditingValue(
          //                 text: config().format_rupiah(subsidiController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(subsidiController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController
          //                       .data_pegawai_keranjang[index].subsidi =
          //                   config().convert_rupiah(subsidiController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].subsidi =
          //                 config().convert_rupiah(subsidiController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // Sub
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       height: 50,
          //       alignment: Alignment.centerLeft,
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.1),
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           controller: subController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   // Harian
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         border: Border.all(color: GreyColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: TextFormField(
          //           controller: harianController,
          //           style: GoogleFonts.poppins(
          //               color: Colors.black,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500),
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          //             hintText: "0.0",
          //             hintStyle: GoogleFonts.poppins(
          //                 color: GreyColor,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 12),
          //             border: InputBorder.none,
          //             focusedBorder: InputBorder.none,
          //             focusedErrorBorder: InputBorder.none,
          //             errorBorder: InputBorder.none,
          //             enabledBorder: InputBorder.none,
          //             disabledBorder: InputBorder.none,
          //           ),
          //           onChanged: (numb) {
          //             if (numb.isNotEmpty) {
          //               harianController.value = TextEditingValue(
          //                 text: config().format_rupiah(harianController.text),
          //                 selection: TextSelection.fromPosition(
          //                   TextPosition(
          //                       offset: config()
          //                           .format_rupiah(harianController.text)
          //                           .length),
          //                 ),
          //               );
          //               boronganController
          //                       .data_pegawai_keranjang[index].harian =
          //                   config().convert_rupiah(harianController.text);
          //               boronganController.hitungSubTotal();
          //               boronganController.notifyListeners();
          //             }
          //           },
          //           onFieldSubmitted: (value) {
          //             boronganController.data_pegawai_keranjang[index].harian =
          //                 config().convert_rupiah(harianController.text);
          //             boronganController.hitungSubTotal();
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            // lain
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
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
                      hintStyle: GoogleFonts.poppins(
                          color: GreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
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
                        boronganController.data_pegawai_keranjang[index].lain =
                            config().convert_rupiah(lainController.text);
                        boronganController.hitungSubTotal();
                        boronganController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      boronganController.data_pegawai_keranjang[index].lain =
                          config().convert_rupiah(lainController.text);
                      boronganController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            // jumlah
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
                    controller: jumlahController,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
                      hintStyle: GoogleFonts.poppins(
                          color: GreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        jumlahController.value = TextEditingValue(
                          text: config().format_rupiah(jumlahController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(jumlahController.text)
                                    .length),
                          ),
                        );
                        boronganController
                                .data_pegawai_keranjang[index].jumlah =
                            config().convert_rupiah(jumlahController.text);
                        boronganController.hitungSubTotal();
                        boronganController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      boronganController.data_pegawai_keranjang[index].jumlah =
                          config().convert_rupiah(jumlahController.text);
                      boronganController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              boronganController.data_pegawai_keranjang.removeAt(index);
              boronganController.hitungSubTotal();
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
