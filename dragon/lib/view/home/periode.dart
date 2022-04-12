import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPeriode extends StatefulWidget {
  @override
  _SettingPeriodeState createState() => _SettingPeriodeState();
}

class _SettingPeriodeState extends State<SettingPeriode> {
  TextEditingController filterperiode = TextEditingController();
  final Future<SharedPreferences> _prefsPeriode =
      SharedPreferences.getInstance();
  SharedPreferences prefsPeriode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Periode'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: HijauColor),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                height: 30,
                width: MediaQuery.of(context).size.width * 0.2,
                child: TextField(
                  controller: filterperiode,
                  decoration: InputDecoration(
                    hintText: "2022/01",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: GreyColor),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  onSubmitted: (value) {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 30,
                child: TextButton(
                  onPressed: () async {
                    prefsPeriode = await _prefsPeriode;
                    prefsPeriode.setString("periode", filterperiode.text);
                    Navigator.of(context).pop();
                  },
                  child: Text('Simpan'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
