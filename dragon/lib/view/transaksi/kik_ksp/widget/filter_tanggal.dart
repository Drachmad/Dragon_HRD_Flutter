import 'package:flutter/material.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/transaksi/kik_ksp_controller.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FilterTanggal extends StatefulWidget {
  @override
  _FilterTanggalState createState() => _FilterTanggalState();
}

class _FilterTanggalState extends State<FilterTanggal> {
  @override
  Widget build(BuildContext context) {
    return Consumer<KikKspController>(
        builder: (context, kik_kspController, child) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.5,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16, bottom: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Icon(Icons.clear, size: 25),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Filter Tanggal",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SfDateRangePicker(
                          controller:
                              kik_kspController.filter_tanggalController,
                          onSelectionChanged:
                              kik_kspController.onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                          selectionColor: HijauColor,
                          endRangeSelectionColor: HijauColor,
                          backgroundColor: Colors.white,
                          rangeSelectionColor: Colors.greenAccent,
                          startRangeSelectionColor: HijauColor,
                          todayHighlightColor: HijauColor,
                          initialSelectedRange:
                              PickerDateRange(DateTime.now(), DateTime.now()),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: InkWell(
                  onTap: () async {
                    if (kik_kspController.isEnable_button) {
                      kik_kspController.selectDataPaginate(true, '');
                      Navigator.pop(context, true);
                    }
                  },
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: (kik_kspController.isEnable_button)
                          ? HijauColor
                          : GreyColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HijauColor),
                    ),
                    child: Center(
                      child: Text(
                        "OK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
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
