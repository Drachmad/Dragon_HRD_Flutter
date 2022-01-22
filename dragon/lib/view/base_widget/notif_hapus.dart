import 'package:flutter/material.dart';
// import 'package:pos_system/controller/po_controller.dart';
import 'package:provider/provider.dart';
import 'package:dragon/config/color.dart';

class NotifHapus extends StatefulWidget {
  @override
  _NotifHapusState createState() => _NotifHapusState();
}

class _NotifHapusState extends State<NotifHapus> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 400,
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text("KONFIRMASI",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.center),
            ),
            Divider(height: 1, color: GreyColor),
            Spacer(),
            Image.asset(
              "assets/images/ic_hapus.png",
              height: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text("Apakah anda yakin ingin menghapus data ?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.center),
            ),
            Spacer(),
            Divider(height: 0, color: GreyColor),
            Row(children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10))),
                  child: Text("Tidak",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black)),
                ),
              )),
              Expanded(
                  child: InkWell(
                onTap: () => Navigator.pop(context, true),
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: HijauColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10))),
                  child: Text(
                    "Iya",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
