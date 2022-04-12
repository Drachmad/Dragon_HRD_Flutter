import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/transaksi/kik_injection_controller.dart';
import 'package:dragon/model/data_kik.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

Widget AddKikInjectionCard(BuildContext context, int index, DataKIK data_kik) {
  TextEditingController qtyController = new TextEditingController();
  TextEditingController upahController = new TextEditingController();
  TextEditingController jumlahController = new TextEditingController();
  TextEditingController orgController = new TextEditingController();
  TextEditingController hrController = new TextEditingController();
  TextEditingController tglController = new TextEditingController();
  final formatter = intl.NumberFormat.decimalPattern();
  qtyController.value = TextEditingValue(
    text: formatter.format(data_kik.qty).toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: formatter.format(data_kik.qty).toString().length),
    ),
  );
  upahController.value = TextEditingValue(
    text: formatter.format(data_kik.upah).toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: formatter.format(data_kik.upah).toString().length),
    ),
  );
  jumlahController.value = TextEditingValue(
    text: config().format_rupiah(data_kik.jumlah.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_kik.jumlah.toString()).length),
    ),
  );
  orgController.value = TextEditingValue(
    text: config().format_rupiah(data_kik.org.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_kik.org.toString()).length),
    ),
  );
  hrController.value = TextEditingValue(
    text: config().format_rupiah(data_kik.hr.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_kik.hr.toString()).length),
    ),
  );
  var kik_injectionController =
      Provider.of<KikInjectionController>(context, listen: false);

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
                height: 40,
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
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_kik.no_kik ?? "",
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
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: kik_injectionController.tglController ?? "",
                    keyboardType: TextInputType.number,
                    inputFormatters: [ThousandsFormatter()],
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
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
                    onTap: () async {
                      kik_injectionController.chooseDate = await showDatePicker(
                              context: context,
                              initialDate: kik_injectionController.chooseDate ??
                                  DateTime.now(),
                              lastDate: DateTime(2050),
                              firstDate: DateTime(DateTime.now().year - 1)) ??
                          kik_injectionController.chooseDate;
                      kik_injectionController.tglController.text =
                          kik_injectionController.format_tanggal
                              .format(kik_injectionController.chooseDate);
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
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_kik.model ?? "",
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
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_kik.item ?? "",
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
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_kik.des1 ?? "",
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
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: qtyController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [ThousandsFormatter()],
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
                        kik_injectionController.data_kik_keranjang[index].qty =
                            int.parse(qtyController.text.replaceAll(',', ''));
                        qtyController.value = TextEditingValue();
                        kik_injectionController.hitungSubTotal();
                        kik_injectionController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      kik_injectionController.data_kik_keranjang[index].qty =
                          int.parse(qtyController.text);
                      kik_injectionController.hitungSubTotal();
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
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: upahController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [ThousandsFormatter()],
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
                        kik_injectionController.data_kik_keranjang[index].upah =
                            int.parse(upahController.text.replaceAll(',', ''));
                        upahController.value = TextEditingValue();
                        kik_injectionController.hitungSubTotal();
                        kik_injectionController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      kik_injectionController.data_kik_keranjang[index].upah =
                          int.parse(upahController.text);
                      kik_injectionController.hitungSubTotal();
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
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: jumlahController,
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
                        jumlahController.value = TextEditingValue(
                          text: config().format_rupiah(jumlahController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(jumlahController.text)
                                    .length),
                          ),
                        );
                        kik_injectionController
                                .data_kik_keranjang[index].jumlah =
                            config().convert_rupiah(jumlahController.text);
                        kik_injectionController.hitungSubTotal();
                        kik_injectionController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      kik_injectionController.data_kik_keranjang[index].jumlah =
                          config().convert_rupiah(jumlahController.text);
                      kik_injectionController.hitungSubTotal();
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
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: orgController,
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
                        orgController.value = TextEditingValue(
                          text: config().format_rupiah(orgController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(orgController.text)
                                    .length),
                          ),
                        );
                        kik_injectionController.data_kik_keranjang[index].org =
                            config().convert_rupiah(orgController.text);
                        kik_injectionController.hitungSubTotal();
                        kik_injectionController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      kik_injectionController.data_kik_keranjang[index].org =
                          config().convert_rupiah(orgController.text);
                      kik_injectionController.hitungSubTotal();
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
                height: 40,
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
                        kik_injectionController.data_kik_keranjang[index].hr =
                            config().convert_rupiah(hrController.text);
                        kik_injectionController.hitungSubTotal();
                        kik_injectionController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      kik_injectionController.data_kik_keranjang[index].hr =
                          config().convert_rupiah(hrController.text);
                      kik_injectionController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              kik_injectionController.data_kik_keranjang.removeAt(index);
              kik_injectionController.hitungSubTotal();
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
