import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/master/hrd_grup_controller.dart';
import 'package:provider/provider.dart';

Widget HRDgrupCard(BuildContext context, int index, HRD_GrupController val_bar,
    {Function pressEdit, Function pressDelete}) {
  int offset = Provider.of<HRD_GrupController>(context, listen: false).offset;

  String kd_grup = val_bar.data_hrdGrupList[index]['kd_grup'] ?? "-";
  String nm_grup = val_bar.data_hrdGrupList[index]['nm_grup'] ?? "-";
  String acno = val_bar.data_hrdGrupList[index]['acno'] ?? "-";

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
              kd_grup,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              nm_grup,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              acno,
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
