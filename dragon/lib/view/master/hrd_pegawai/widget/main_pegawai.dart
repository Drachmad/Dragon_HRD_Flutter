import 'package:flutter/material.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/animation_custom_dialog.dart';
import 'package:dragon/controller/master/hrd_pegawai_controller.dart';
import 'package:dragon/view/master/hrd_pegawai/pilih_bagian.dart';

Widget MainPegawai(
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
                          "NIK",
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
                            controller: pegawaiController.nikController,
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
                          "Nama Pegawai",
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
                            controller: pegawaiController.nm_pegController,
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
                          "Kode Bagian",
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
                            controller: pegawaiController.kd_bagController,
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
                            onTap: () {
                              showAnimatedDialog(
                                  context,
                                  PilihBagian(
                                      pegawaiController
                                              .kd_bagController.text.isEmpty
                                          ? null
                                          : pegawaiController
                                              .nm_bagController.text,
                                      pegawaiController),
                                  isFlip: false);
                            },
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            enabled: false,
                            controller: pegawaiController.nm_bagController,
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
                          "Status",
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
                            controller: pegawaiController.aktifController,
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
                          "Jenis Kelamin",
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
                            controller: pegawaiController.jkController,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "KPJ",
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
                            controller: pegawaiController.kpjController,
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
                          "BPJS",
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
                            controller: pegawaiController.bpjsController,
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
                          "Alamat",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: GreyColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            maxLines: 8,
                            controller: pegawaiController.alamatController,
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
                          "Kota",
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
                            controller: pegawaiController.kotaController,
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
                          "Kabupaten",
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
                            controller: pegawaiController.kabController,
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
                          "Pendidikan",
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
                            controller: pegawaiController.pendidikanController,
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
                          "Tanggal Masuk",
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
                            controller: pegawaiController.tgl_masukController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
                              icon: Image.asset(
                                "assets/images/ic_tanggal.png",
                                height: 20,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            onTap: () async {
                              pegawaiController.chooseDate =
                                  await showDatePicker(
                                          context: context,
                                          initialDate:
                                              pegawaiController.chooseDate ??
                                                  DateTime.now(),
                                          lastDate: DateTime(2050),
                                          firstDate:
                                              DateTime(DateTime.now().year)) ??
                                      pegawaiController.chooseDate;
                              pegawaiController.tgl_masukController.text =
                                  pegawaiController.format_tanggal
                                      .format(pegawaiController.chooseDate);
                            },
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
                          "DR",
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
                            controller: pegawaiController.drController,
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
                          "REC",
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
                            controller: pegawaiController.recController,
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
        ],
      ),
    ),
  );
}
