import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/account_controller.dart';
import 'package:dragon/view/base_widget/toast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PilihAccount extends StatefulWidget {
  String account_terpilih;
  var controller;

  PilihAccount(this.account_terpilih, this.controller);

  @override
  _PilihAccountState createState() => _PilihAccountState();
}

class _PilihAccountState extends State<PilihAccount> {
  TextEditingController searchController = TextEditingController();
  int index_terpilih;

  @override
  void initState() {
    Provider.of<AccountController>(context, listen: false)
        .selectDataModalBank("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountController>(
        builder: (context, accountController, child) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text("Pilih Account",
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
                      accountController.selectDataModalBank(value);
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
                      "Account#",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: GreyColor),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Nama",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: GreyColor),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: accountController.data_modalbankList.length,
                itemBuilder: (BuildContext context, int index) {
                  return accountCard(index);
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
                    widget.controller.bacnoController.text = accountController
                        .data_modalbankList[index_terpilih]['ACNO'];
                    widget.controller.bnamaController.text = accountController
                        .data_modalbankList[index_terpilih]['NAMA'];
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

  Widget accountCard(int index) {
    bool isActive = index == index_terpilih;
    var data_account = Provider.of<AccountController>(context, listen: false)
        .data_modalbankList[index];
    if (widget.account_terpilih != null) {
      if (data_account['ACNO'] == widget.account_terpilih) {
        isActive = true;
        index_terpilih = index;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {
          index_terpilih = index;
          widget.account_terpilih = data_account['ACNO'];
          setState(() {});
        },
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      data_account['ACNO'],
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      data_account['NAMA'],
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  (isActive)
                      ? Image.asset(
                          "assets/images/ic_success.png",
                          width: 30,
                        )
                      : SizedBox(
                          width: 30,
                          height: 30,
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
      ),
    );
  }
}
