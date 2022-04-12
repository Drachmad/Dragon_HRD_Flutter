import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/controller/master/hrd_pegawai_controller.dart';
import 'package:dragon/view/master/hrd_pegawai/widget/main_pegawai.dart';
import 'package:dragon/view/master/hrd_pegawai/widget/gaji_pegawai.dart';
import 'package:provider/provider.dart';

class TambahPegawaiScreen extends StatefulWidget {
  bool isModeEdit;
  var data_pegawai;

  TambahPegawaiScreen({this.isModeEdit, this.data_pegawai});

  @override
  _TambahPegawaiScreenState createState() => _TambahPegawaiScreenState();
}

class _TambahPegawaiScreenState extends State<TambahPegawaiScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int menu_index = 0;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    var m_pegawai = Provider.of<HRD_PegawaiController>(context, listen: false);
    if (widget.isModeEdit) {
      m_pegawai.nikController.text = widget.data_pegawai['nik'] ?? "";
      m_pegawai.nm_pegController.text = widget.data_pegawai['nm_peg'] ?? "";
      m_pegawai.kd_bagController.text = widget.data_pegawai['kd_bag'] ?? "";
      m_pegawai.nm_bagController.text = widget.data_pegawai['nm_bag'] ?? "";
      m_pegawai.aktifController.text =
          widget.data_pegawai['aktif'].toString() ?? "";
      jkValue =
          (widget.data_pegawai['jk'] == "L") ? "Laki - Laki" : "Perempuan";
      m_pegawai.kpjController.text =
          widget.data_pegawai['kpj'].toString() ?? "";
      m_pegawai.bpjsController.text =
          widget.data_pegawai['bpjs'].toString() ?? "";
      m_pegawai.alamatController.text = widget.data_pegawai['alamat'] ?? "";
      m_pegawai.kotaController.text = widget.data_pegawai['kota'] ?? "";
      m_pegawai.kabController.text =
          widget.data_pegawai['kab'].toString() ?? "";
      m_pegawai.pendidikanController.text =
          widget.data_pegawai['pendidikan'].toString() ?? "";
      m_pegawai.tgl_masukController.text =
          widget.data_pegawai['tgl_masuk'].toString() ?? "";
      m_pegawai.drController.text = widget.data_pegawai['dr'].toString() ?? "";
      m_pegawai.recController.text =
          widget.data_pegawai['rec'].toString() ?? "";
      m_pegawai.pokokController.text =
          widget.data_pegawai['pokok'].toString() ?? "";
      m_pegawai.umakanController.text =
          widget.data_pegawai['umakan'].toString() ?? "";
      m_pegawai.tjabatanController.text =
          widget.data_pegawai['tjabatan'].toString() ?? "";
      m_pegawai.tperbulanController.text =
          widget.data_pegawai['tperbulan'].toString() ?? "";
      m_pegawai.tastekController.text =
          widget.data_pegawai['tastek'].toString() ?? "";
      m_pegawai.premiController.text =
          widget.data_pegawai['premi'].toString() ?? "";
      m_pegawai.lblController.text =
          widget.data_pegawai['lbl'].toString() ?? "";
      m_pegawai.ulemburController.text =
          widget.data_pegawai['ulembur'].toString() ?? "";
      m_pegawai.gajiController.text =
          (int.parse(m_pegawai.pokokController.text) +
                      int.parse(m_pegawai.umakanController.text) +
                      int.parse(m_pegawai.tjabatanController.text))
                  .toString() ??
              "0";
      m_pegawai.nettController.text =
          (int.parse(m_pegawai.gajiController.text) +
                      int.parse(m_pegawai.tperbulanController.text) +
                      int.parse(m_pegawai.tastekController.text) +
                      int.parse(m_pegawai.premiController.text) +
                      int.parse(m_pegawai.lblController.text))
                  .toString() ??
              "0";
    } else {
      m_pegawai.resetField();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HRD_PegawaiController>(
        builder: (context, pegawaiController, child) {
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
                (widget.isModeEdit) ? "Edit Pegawai" : "Tambah Pegawai",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.black.withOpacity(0.1), // Tab Bar color change
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    controller: _tabController,
                    unselectedLabelColor: HijauColor,
                    labelColor: Colors.black,
                    indicatorWeight: 2,
                    indicatorColor: HijauColor,
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    tabs: <Widget>[
                      Tab(
                        text: "Main",
                      ),
                      Tab(
                        text: "Gaji",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[
                    MainPegawai(context, pegawaiController),
                    GajiPegawai(context, pegawaiController),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 24, right: 23, top: 8, bottom: 16),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  color: GreyColor,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
                            pegawaiController
                                .edit_pegawai(widget.data_pegawai['no_id'])
                                .then((value) {
                              if (value != null) {
                                if (value) {
                                  pegawaiController.selectData("");
                                  Navigator.pop(context);
                                }
                              }
                            });
                          } else {
                            pegawaiController.tambah_pegawai().then((value) {
                              if (value != null) {
                                if (value) {
                                  pegawaiController.resetField();
                                  pegawaiController.selectData("");
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
