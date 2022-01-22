import 'package:custom_datatable/custom_datatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/animation_custom_dialog.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/master/sp_barang_controller.dart';
import 'package:dragon/view/base_widget/notif_hapus.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:dragon/view/master/sp_barang/tambah_sp_barang_screen.dart';
import 'package:dragon/view/master/sp_barang/sp_barang_card.dart';
import 'package:provider/provider.dart';

class DataBarangScreen extends StatefulWidget {
  @override
  _DataBarangScreenState createState() => _DataBarangScreenState();
}

class _DataBarangScreenState extends State<DataBarangScreen> {
  TextEditingController cari = new TextEditingController();

  @override
  void initState() {
    Provider.of<SP_Barang_Controller>(context, listen: false).setProsess(true);
    Provider.of<SP_Barang_Controller>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SP_Barang_Controller>(
        builder: (context, barangController, child) {
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
                "DATA BARANG",
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
                hoverColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              TambahBarangScreen(isModeEdit: false)));
                },
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/ic_add.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Tambah Baru",
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
                      flex: 6,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/ic_search.png",
                              height: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 1,
                                height: 25,
                                color: GreyColor,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                child: TextField(
                                  controller: cari,
                                  onChanged: (value) {
                                    Provider.of<SP_Barang_Controller>(context,
                                            listen: false)
                                        .setProsess(true);
                                    Provider.of<SP_Barang_Controller>(context,
                                            listen: false)
                                        .selectData(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Cari Disini",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: GreyColor),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 14),
                                    border: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
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
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "NO",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "KODE BARANG",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "NAMA BARANG",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "RAK",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "AKTIF",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "FLAG",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "DRAGON",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              // PaginatedDataTable(
              //   rowsPerPage: 10,
              // ),

              /// paginate ///
              Expanded(
                child: (barangController.data_spBarangList.length > 0)
                    ? ListView.builder(
                        itemCount: barangController.data_spBarangList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BarangCard(context, index, barangController,
                              pressEdit: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TambahBarangScreen(
                                        isModeEdit: true,
                                        data_barang: barangController
                                            .data_spBarangList[index])));
                          }, pressDelete: () {
                            showAnimatedDialog_withCallBack(
                                context, NotifHapus(), isFlip: true,
                                callback: (value) {
                              if (value != null) {
                                if (value) {
                                  if (value) {
                                    barangController.hapus_barang(
                                        barangController
                                            .data_spBarangList[index]);
                                    Toast("Delete Success !",
                                        "Berhasil menghapus data", true);
                                  } else {
                                    Toast("Delete Failed !",
                                        "Gagal menghapus data", false);
                                  }
                                  barangController.notifyListeners();
                                }
                              }
                            });
                          });
                        },
                      )
                    : Container(
                        child: Center(
                          child: Text(
                            "Tidak ada data",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: GreyColor),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),

        /// paginate ///
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: GreyColor,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (barangController.data_spBarangList.length > 0)
                  Text(
                    (barangController.offset + 1 <
                            barangController.totalNotaTerima)
                        ? "Showing ${barangController.offset + 1} to ${barangController.offset + barangController.limit} of ${barangController.totalNotaTerima} entries"
                        : "Showing ${barangController.offset + 1} to ${barangController.totalNotaTerima} of ${barangController.totalNotaTerima} entries",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                if (barangController.data_spBarangList.length > 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: GreyColor,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            iconEnabledColor: HijauColor,
                            value: barangController.limit,
                            items: barangController.dropdownLimit,
                            onChanged: (value) {
                              if (value != null) {
                                barangController.limit = value;
                                barangController.selectDataPaginate(
                                    false, cari.text);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                Spacer(),
                InkWell(
                  onTap: () {
                    if (barangController.page_index > 0) {
                      barangController.offset -= barangController.limit;
                      barangController.page_index--;
                      barangController.c_page.text =
                          (barangController.page_index + 1).toString();
                      barangController.selectDataPaginate(false, cari.text);
                    }
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: GreyColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(1, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: Text(
                        "Previous",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: (barangController.offset == 0)
                                ? GreyColor
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
                pageField(),
                InkWell(
                  onTap: () {
                    if (barangController.page_index <=
                        barangController.pageCount - 1) {
                      barangController.offset += barangController.limit;
                      barangController.page_index++;
                      barangController.c_page.text =
                          (barangController.page_index + 1).toString();
                      barangController.selectDataPaginate(false, cari.text);
                    }
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: GreyColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(1, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ((barangController.pageCount -
                                        barangController.page_index) <=
                                    1)
                                ? GreyColor
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  ///paginate
  Widget pageField() {
    SP_Barang_Controller pageTerima =
        Provider.of<SP_Barang_Controller>(context, listen: false);
    return Container(
      width: 70,
      height: 35,
      child: TextField(
        textAlign: TextAlign.center,
        controller: pageTerima.c_page,
        decoration: InputDecoration(
          hintText: "1",
          hintStyle: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w400, color: GreyColor),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        onSubmitted: (value) {
          int index = 1;
          try {
            index = int.parse(value.trim());
          } catch (e) {
            index = 1;
          }
          if (index == 0) {
            index = 1;
          } else {
            if (index > 0) {
              index = index - 1;
            }
          }
          if (index > pageTerima.page_index) {
            pageTerima.offset = (index * pageTerima.limit);
            pageTerima.page_index = index;
            pageTerima.c_page.text = (pageTerima.page_index + 1).toString();
            pageTerima.selectDataPaginate(false, cari.text);
          } else if (index < pageTerima.page_index) {
            pageTerima.offset = (index * pageTerima.limit);
            pageTerima.page_index = index;
            pageTerima.c_page.text = (pageTerima.page_index + 1).toString();
            pageTerima.selectDataPaginate(false, cari.text);
          }
        },
      ),
    );
  }
}
