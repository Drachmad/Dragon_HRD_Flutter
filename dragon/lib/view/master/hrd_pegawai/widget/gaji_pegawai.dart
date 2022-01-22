import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dragon/config/animation_custom_dialog.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/master/hrd_pegawai_controller.dart';

Widget GajiPegawai(
    BuildContext context, HRD_PegawaiController pegawaiController) {
  return Container(
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pokok",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.pokokController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "U Makan",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.umakanController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "T Jabatan",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.tjabatanController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "T Perbulan",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.tperbulanController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "T Astek",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.tastekController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 4, child: SizedBox()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PL",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.premiController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LBL",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.lblController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "U Lembur",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: pegawaiController.ulemburController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
          Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 16)),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gaji",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            enabled: false,
                            controller: pegawaiController.gajiController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nett",
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            enabled: false,
                            controller: pegawaiController.nettController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
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
                Expanded(flex: 4, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
