import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/transaksi/bankkeluar_controller.dart';
import 'package:dragon/model/data_account.dart';
import 'package:provider/provider.dart';

Widget AddBankKeluarCard(
    BuildContext context, int index, DataAccount data_account) {
  TextEditingController nacnoController = new TextEditingController();
  TextEditingController reffController = new TextEditingController();
  TextEditingController hargaController = new TextEditingController();
  double subTotal = data_account.jumlah;
  nacnoController.value = TextEditingValue(
    text: data_account.nacno.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_account.nacno.toString().length),
    ),
  );
  reffController.value = TextEditingValue(
    text: data_account.reff ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_account.reff.toString().length),
    ),
  );
  hargaController.value = TextEditingValue(
    text: config().format_rupiah(data_account.jumlah.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset:
              config().format_rupiah(data_account.jumlah.toString()).length),
    ),
  );
  var bankkeluarController =
      Provider.of<BankkeluarController>(context, listen: false);

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
            child: Text(
              "${index + 1}.",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data_account.acno ?? "",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 40,
                child: TextFormField(
                  controller: nacnoController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                    hintText: "-",
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
                      bankkeluarController.data_account_keranjang[index].nacno =
                          nacnoController.text;
                      bankkeluarController.hitungSubTotal();
                      bankkeluarController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    bankkeluarController.data_account_keranjang[index].nacno =
                        nacnoController.text;
                    bankkeluarController.hitungSubTotal();
                  },
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
                child: TextFormField(
                  controller: reffController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                    hintText: "Uraian",
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
                      bankkeluarController.data_account_keranjang[index].reff =
                          reffController.text;
                      // bankkeluarController.hitungSubTotal();
                      bankkeluarController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    bankkeluarController.data_account_keranjang[index].reff =
                        reffController.text;
                    // bankkeluarController.hitungSubTotal();
                  },
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
                child: TextFormField(
                  controller: hargaController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                    hintText: "Rp 0",
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
                      hargaController.value = TextEditingValue(
                        text: config().format_rupiah(hargaController.text),
                        selection: TextSelection.fromPosition(
                          TextPosition(
                              offset: config()
                                  .format_rupiah(hargaController.text)
                                  .length),
                        ),
                      );
                      bankkeluarController
                              .data_account_keranjang[index].jumlah =
                          config().convert_rupiah(hargaController.text);
                      bankkeluarController.hitungSubTotal();
                      bankkeluarController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    bankkeluarController.data_account_keranjang[index].jumlah =
                        config().convert_rupiah(hargaController.text);
                    bankkeluarController.hitungSubTotal();
                  },
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              bankkeluarController.data_account_keranjang.removeAt(index);
              bankkeluarController.hitungSubTotal();
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
