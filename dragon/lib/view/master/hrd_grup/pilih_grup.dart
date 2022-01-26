import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/pilih_grup_controller.dart';
import 'package:dragon/controller/master/hrd_grup_controller.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PilihGrup extends StatefulWidget {
  String grup_terpilih;
  var controller;

  PilihGrup(this.grup_terpilih, this.controller);

  @override
  _PilihGrupState createState() => _PilihGrupState();
}

class _PilihGrupState extends State<PilihGrup> {
  int index_terpilih;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<PilihGrupController>(context, listen: false).initData('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PilihGrupController>(
        builder: (context, grupController, child) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text("PILIH GRUP",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.center),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Card(
                color: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 18, bottom: 18),
                      icon: Image.asset(
                        "assets/images/ic_search.png",
                        height: 25,
                      ),
                      hintText: "Cari disini",
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
                    onChanged: (value) {
                      grupController.initData(value);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Kode Grup",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: GreyColor),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Nama Grup",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: GreyColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: grupController.data_grupList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GrupCard(index);
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(height: 0, color: GreyColor),
            Row(children: [
              Expanded(
                  child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10))),
                  child: Text("Batal",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black87)),
                ),
              )),
              Expanded(
                  child: InkWell(
                onTap: () async {
                  if (index_terpilih != null) {
                    Provider.of<HRD_GrupController>(context, listen: false)
                            .kd_grupController
                            .text =
                        grupController.data_grupList[index_terpilih]['kd_grup'];
                    Provider.of<HRD_GrupController>(context, listen: false)
                            .nm_grupController
                            .text =
                        grupController.data_grupList[index_terpilih]['nm_grup'];
                    Provider.of<HRD_GrupController>(context, listen: false)
                            .acnoController
                            .text =
                        grupController.data_grupList[index_terpilih]['acno'];
                    Navigator.pop(context);
                  } else {
                    Toast("Peringatan", "Belum ada data terpilih", false);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10))),
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              )),
            ]),
          ]),
        ),
      );
    });
  }

  Widget GrupCard(int index) {
    bool isActive = index == index_terpilih;
    var data_grup = Provider.of<PilihGrupController>(context, listen: false)
        .data_grupList[index];
    if (widget.grup_terpilih != null) {
      if (data_grup['NAMAS'] == widget.grup_terpilih) {
        isActive = true;
        index_terpilih = index;
      }
    }
    return InkWell(
      onTap: () {
        index_terpilih = index;
        widget.grup_terpilih = data_grup['NAMAS'];
        setState(() {});
      },
      child: Container(
        color: isActive ? kPrimaryColor : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    data_grup['kd_grup'].toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : Colors.black),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    data_grup['nm_grup'],
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
