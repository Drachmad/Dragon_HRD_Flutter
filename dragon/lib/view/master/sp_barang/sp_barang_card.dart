import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/master/sp_barang_controller.dart';
import 'package:provider/provider.dart';

Widget BarangCard(BuildContext context, int index, SP_Barang_Controller val_bar,
    {Function pressEdit, Function pressDelete}) {
  int offset = Provider.of<SP_Barang_Controller>(context, listen: false).offset;

  String KD_BHN = val_bar.data_spBarangList[index]['KD_BHN'] ?? "-";
  String NA_BHN = val_bar.data_spBarangList[index]['NA_BHN'] ?? "-";
  String RAK = val_bar.data_spBarangList[index]['RAK'] ?? "-";
  String AKTIF = val_bar.data_spBarangList[index]['AKTIF'].toString() ?? "-";
  String FLAG = val_bar.data_spBarangList[index]['FLAG'] ?? "-";
  String DR = val_bar.data_spBarangList[index]['DR'] ?? "-";

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${index + offset + 1}.",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              KD_BHN,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              NA_BHN,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              RAK,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              AKTIF,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              FLAG,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              DR,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 1,
            child: OnHoverButton(
              child: InkWell(
                onTap: pressEdit,
                child: Container(
                  height: 25,
                  child: Center(
                    child: Image.asset(
                      "assets/images/ic_edit.png",
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: AbuColor,
          ),
          Expanded(
            flex: 1,
            child: OnHoverButton(
              child: InkWell(
                onTap: pressDelete,
                child: Container(
                  height: 25,
                  child: Center(
                    child: Image.asset(
                      "assets/images/ic_hapus.png",
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
