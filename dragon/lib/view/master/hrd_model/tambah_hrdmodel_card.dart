import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/master/hrd_model_controller.dart';
import 'package:dragon/model/data_bagian.dart';
import 'package:provider/provider.dart';

Widget AddHRDmodelCard(
    BuildContext context, int index, DataBagian data_bagian) {
  TextEditingController kd_bagController = new TextEditingController();
  TextEditingController nm_bagController = new TextEditingController();
  TextEditingController prosesController = new TextEditingController();
  TextEditingController urut_keController = new TextEditingController();
  TextEditingController kodeController = new TextEditingController();
  TextEditingController itemController = new TextEditingController();
  TextEditingController des1Controller = new TextEditingController();
  TextEditingController upahController = new TextEditingController();

  prosesController.value = TextEditingValue(
    text: data_bagian.proses ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bagian.proses.toString().length),
    ),
  );
  urut_keController.value = TextEditingValue(
    text: data_bagian.urut_ke ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bagian.urut_ke.toString().length),
    ),
  );
  kodeController.value = TextEditingValue(
    text: data_bagian.kode ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bagian.kode.toString().length),
    ),
  );
  itemController.value = TextEditingValue(
    text: data_bagian.item ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bagian.item.toString().length),
    ),
  );
  des1Controller.value = TextEditingValue(
    text: data_bagian.des1 ?? "",
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bagian.des1.toString().length),
    ),
  );
  upahController.value = TextEditingValue(
    text: config().format_rupiah(data_bagian.upah.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_bagian.upah.toString()).length),
    ),
  );
  // jumlahController.value = TextEditingValue(
  //   text: config().format_rupiah(data_bagian.jumlah.toString()),
  //   selection: TextSelection.fromPosition(
  //     TextPosition(
  //         offset:
  //             config().format_rupiah(data_bagian.jumlah.toString()).length),
  //   ),
  // );
  var hrd_modelController =
      Provider.of<HRDmodelController>(context, listen: false);

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "${index + 1}.",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_bagian.kd_bag ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    data_bagian.nm_bag ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: prosesController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        hrd_modelController.data_bagian_keranjang[index]
                            .proses = prosesController.text;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: urut_keController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        hrd_modelController.data_bagian_keranjang[index]
                            .urut_ke = urut_keController.text;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: kodeController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        hrd_modelController.data_bagian_keranjang[index].kode =
                            kodeController.text;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: itemController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        hrd_modelController.data_bagian_keranjang[index].item =
                            itemController.text;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: des1Controller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        hrd_modelController.data_bagian_keranjang[index].des1 =
                            des1Controller.text;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: upahController,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                      hintText: "0.0",
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
                    onChanged: (numb) {
                      if (numb.isNotEmpty) {
                        upahController.value = TextEditingValue(
                          text: config().format_rupiah(upahController.text),
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                offset: config()
                                    .format_rupiah(upahController.text)
                                    .length),
                          ),
                        );
                        hrd_modelController.data_bagian_keranjang[index].upah =
                            config().convert_rupiah(upahController.text);
                        hrd_modelController.hitungSubTotal();
                        hrd_modelController.notifyListeners();
                      }
                    },
                    onFieldSubmitted: (value) {
                      hrd_modelController.data_bagian_keranjang[index].upah =
                          config().convert_rupiah(upahController.text);
                      hrd_modelController.hitungSubTotal();
                    },
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              hrd_modelController.data_bagian_keranjang.removeAt(index);
              hrd_modelController.hitungSubTotal();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                "assets/images/ic_hapus.png",
                height: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
