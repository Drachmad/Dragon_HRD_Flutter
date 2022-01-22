import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/master/pembelian_supplier_controller.dart';
import 'package:provider/provider.dart';

class TambahSupplierScreen extends StatefulWidget {
  bool isModeEdit;
  var data_supplier;

  TambahSupplierScreen({this.isModeEdit, this.data_supplier});

  @override
  _TambahSupplierScreenState createState() => _TambahSupplierScreenState();
}

class _TambahSupplierScreenState extends State<TambahSupplierScreen> {
  @override
  void initState() {
    var m_pemsupplier =
        Provider.of<Pembelian_SupplierController>(context, listen: false);
    if (widget.isModeEdit) {
      m_pemsupplier.KODESController.text = widget.data_supplier['KODES'] ?? "";
      m_pemsupplier.NAMASController.text = widget.data_supplier['NAMAS'] ?? "";
      m_pemsupplier.KOTAController.text = widget.data_supplier['KOTA'] ?? "";
    } else {
      m_pemsupplier.resetField();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Pembelian_SupplierController>(
        builder: (context, pemsupplierController, child) {
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
                (widget.isModeEdit) ? "Edit Bagian" : "Tambah Bagian",
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
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, right: 23, top: 16),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
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
                                      "KODES",
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller: pemsupplierController
                                            .KODESController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
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
                                      "NAMAS",
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller: pemsupplierController
                                            .NAMASController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
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
                                      "KOTA",
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: TextFormField(
                                        controller: pemsupplierController
                                            .KOTAController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 18, bottom: 18),
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
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OnHoverButton(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: GreyColor),
                                  color: kBackgroundColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 8),
                                child: Text(
                                  "Batal",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          OnHoverButton(
                            child: InkWell(
                              onTap: () {
                                if (widget.isModeEdit) {
                                  pemsupplierController
                                      .edit_pemsupplier(
                                          widget.data_supplier['no_id'])
                                      .then((value) {
                                    if (value != null) {
                                      if (value) {
                                        pemsupplierController.selectData("");
                                        Navigator.pop(context);
                                      }
                                    }
                                  });
                                } else {
                                  pemsupplierController
                                      .tambah_pemsupplier()
                                      .then((value) {
                                    if (value != null) {
                                      if (value) {
                                        pemsupplierController.resetField();
                                        pemsupplierController.selectData("");
                                        Navigator.pop(context);
                                      }
                                    }
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HijauColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 8),
                                child: Text(
                                  "Simpan",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
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
