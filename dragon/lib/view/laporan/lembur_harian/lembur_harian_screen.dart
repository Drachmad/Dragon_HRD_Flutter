// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:dragon/view/laporan/lembur_harian/widget/pilih_bagian.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/animation_custom_dialog.dart';
import 'package:dragon/config/color.dart';
import 'package:provider/provider.dart';
import 'package:dragon/constants.dart';
import 'package:dragon/controller/laporan/lembur_harian_controller.dart';

class LemburHarianScreen extends StatefulWidget {
  @override
  _LemburHarianScreenState createState() => _LemburHarianScreenState();
}

class _LemburHarianScreenState extends State<LemburHarianScreen> {
  String baseUrl = base_url;
  @override
  void initState() {
    Provider.of<LemburHarianController>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LemburHarianController>(
        builder: (context, lembur_harian, child) {
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
                "Laporan Lembur Harian",
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
            // if (Provider.of<LoginController>(context, listen: false)
            //         .ROLE ==
            //     1)
            // OnHoverButton(
            //   child: InkWell(
            //     hoverColor: Colors.transparent,
            //     onTap: () {},
            //     child: Container(
            //       height: 30,
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Image.asset(
            //             "assets/images/ic_add.png",
            //             height: 30,
            //           ),
            //           SizedBox(
            //             width: 8,
            //           ),
            //           Text(
            //             "Tambah Baru",
            //             style: GoogleFonts.poppins(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.black),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 16,
            // ),
            // OnHoverButton(
            //   child: InkWell(
            //     onTap: () {},
            //     hoverColor: Colors.white,
            //     child: Container(
            //       height: 30,
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Image.asset(
            //             "assets/images/ic_download.png",
            //             height: 30,
            //           ),
            //           SizedBox(
            //             width: 8,
            //           ),
            //           Text(
            //             "Export",
            //             style: GoogleFonts.poppins(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.black),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 16,
            // ),
            OnHoverButton(
              child: InkWell(
                hoverColor: Colors.white,
                onTap: () {
                  lembur_harian.proses_export_lembur_harian(1);
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
                        "Cetak",
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
                      flex: 3,
                      child: InkWell(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          height: 50,
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: lembur_harian.tglController,
                            decoration: InputDecoration(
                              hintText: 'Semua Tanggal',
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
                              lembur_harian.chooseDate = await showDatePicker(
                                      context: context,
                                      initialDate: lembur_harian.chooseDate ??
                                          DateTime.now(),
                                      lastDate: DateTime(2050),
                                      firstDate: DateTime(2020)) ??
                                  lembur_harian.chooseDate;
                              lembur_harian.tglController.text = lembur_harian
                                  .chooseDate
                                  .toString()
                                  .substring(0, 10);
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          height: 50,
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: lembur_harian.kd_bagController,
                            decoration: InputDecoration(
                              hintText: 'Semua Bagian',
                              contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 18),
                              icon: Image.asset(
                                "assets/images/ic_download.png",
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
                              showAnimatedDialog_withCallBack(
                                  context, PilihBagian("", lembur_harian),
                                  isFlip: true, callback: (value) {
                                if (value != null) {
                                  if (value) {
                                    lembur_harian.notifyListeners();
                                  } else {
                                    lembur_harian.notifyListeners();
                                    Navigator.pop(context, true);
                                  }
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          height: 50,
                          decoration: BoxDecoration(
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
                          child: ElevatedButton(
                            onPressed: () {
                              lembur_harian.select_data(
                                  lembur_harian.kd_bagController.text,
                                  lembur_harian.tglController.text);
                            },
                            child: Text('TAMPIL'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: (lembur_harian.data_list.length > 0)
                    ? ListView(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24, top: 16, bottom: 4),
                          child: PaginatedDataTable(
                            source: MyData(lembur_harian.data_list, context,
                                lembur_harian),
                            // header: Text('My Products'),
                            columns: [
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text('No Bukti'),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text('Nama Pegawai'),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text('Bagian'),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text('Tanggal'),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text('U Lembur'),
                                ),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            initialFirstRowIndex: 0,
                            columnSpacing: 0,
                            horizontalMargin: 10,
                            rowsPerPage: 10,
                            showCheckboxColumn: true,
                          ),
                        ),
                      ])
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

class MyData extends DataTableSource {
  var dtx = [];
  BuildContext context;
  LemburHarianController lembur_harian;
  MyData(this.dtx, this.context, this.lembur_harian);
  bool get isRowCountApproximate => false;
  int get rowCount => dtx.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(''),
      ),
      DataCell(
        Text(
          dtx[index]['NO_BUKTI'].toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      DataCell(
        Text(
          dtx[index]['NM_PEG'].toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      DataCell(
        Text(
          dtx[index]['BAGIAN'].toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      DataCell(
        Text(
          dtx[index]['TGL'].toString().substring(0, 10),
          style: TextStyle(color: Colors.black),
        ),
      ),
      DataCell(
        Text(
          dtx[index]['ULEMBUR'].toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      DataCell(
        Text(''),
      ),
    ]);
  }
}
