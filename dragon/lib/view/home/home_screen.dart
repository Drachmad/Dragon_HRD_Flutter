import 'package:dragon/view/master/sp_bagian/data_bagian_screen.dart';
import 'package:dragon/view/master/sp_barang/data_sp_barang_screen.dart';
import 'package:dragon/view/master/sp_inventori/data_inventori_screen.dart';
import 'package:dragon/view/master/hrd_pegawai/data_pegawai_screen.dart';
import 'package:dragon/view/master/hrd_bagian/data_hrdbagian_screen.dart';
import 'package:dragon/view/master/hrd_borongan/data_hrdborongan_screen.dart';
import 'package:dragon/view/master/hrd_grup/data_hrdgrup_screen.dart';
import 'package:dragon/view/master/hrd_model/data_hrdmodel_screen.dart';
import 'package:dragon/view/master/pem_supplier/data_pemsupplier_screen.dart';
import 'package:dragon/view/master/pem_bahan/data_pembahan_screen.dart';
import 'package:dragon/view/master/pem_mesin/data_mesin_screen.dart';
import 'package:dragon/view/master/pem_nonbahan/data_nonbahan_screen.dart';
import 'package:dragon/view/master/pem_sparepart/data_sparepart_screen.dart';
import 'package:dragon/view/laporan/absen_harian/absen_harian_screen.dart';
import 'package:dragon/view/laporan/absen_lemburan/absen_lemburan_screen.dart';
import 'package:dragon/view/laporan/lembur_harian/lembur_harian_screen.dart';
import 'package:dragon/view/laporan/lembur_borongan/lembur_borongan_screen.dart';
import 'package:dragon/view/laporan/lembur_perjam/lembur_perjam_screen.dart';
import 'package:dragon/view/transaksi/harian/harian_screen.dart';
import 'package:dragon/view/transaksi/borongan/borongan_screen.dart';
import 'package:dragon/view/transaksi/kik_jahit/kik_jahit_screen.dart';
import 'package:dragon/view/transaksi/kasmasuk/kasmasuk_screen.dart';
import 'package:dragon/view/transaksi/kaskeluar/kaskeluar_screen.dart';
import 'package:dragon/view/transaksi/bankmasuk/bankmasuk_screen.dart';
import 'package:dragon/view/transaksi/bankkeluar/bankkeluar_screen.dart';
import 'package:dragon/view/transaksi/memo/memo_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dragon/config/OnHoverButton.dart';
import 'package:dragon/config/color.dart';
import 'package:dragon/config/config.dart';
import 'package:dragon/controller/home_controller.dart';
import 'package:dragon/controller/login_controller.dart';
import 'package:dragon/view/home/pie_chart.dart';
import 'package:dragon/view/login/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Provider.of<HomeController>(context, listen: false).baca_allData(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scafoldKey = GlobalKey<ScaffoldState>();
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Scaffold(
        key: scafoldKey,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.menu,
          //     color: Colors.indigo,
          //   ),
          //   onPressed: () => scafoldKey.currentState.openDrawer(),
          // ),
          title: Row(
            children: [
              InkWell(
                onTap: () =>
                    // homeController.baca_allData(0);
                    scafoldKey.currentState.openDrawer(),
                child: Container(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    "assets/images/ic_home.png",
                    height: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                config.nama_perusahaan,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage("assets/images/ic_user.png"),
                    height: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    Provider.of<LoginController>(context, listen: false)
                        .nama_staff,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HijauColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PopupMenuButton(
                tooltip: "Option Menu",
                elevation: 1,
                icon: Image(
                  image: AssetImage("assets/images/ic_setting.png"),
                  height: 30,
                ),
                iconSize: 30,
                itemBuilder: (context) {
                  return [
                    if (Provider.of<LoginController>(context, listen: false)
                            .ROLE !=
                        1)
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/ic_staff.png",
                              height: 20,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Profil"),
                          ],
                        ),
                        value: 7,
                      ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_logout.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text("Logout"),
                        ],
                      ),
                      value: 7,
                    ),
                  ];
                },
                onSelected: (value) async {
                  if (value == 1) {
                    //Navigator.push(context,
                    //    MaterialPageRoute(builder: (_) => DataBarangScreen()));
                    // } else if (value == 2) {
                    //   // Navigator.push(context,
                    //   //     MaterialPageRoute(builder: (_) => DataStaffScreen()));
                    // } else if (value == 3) {
                    //   // Navigator.push(context,
                    //   //     MaterialPageRoute(builder: (_) => DataSalesScreen()));
                    // } else if (value == 4) {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => DataSupplierScreen()));
                    // } else if (value == 5) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (_) => DataCustomerScreen()));
                    // } else if (value == 6) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (_) => DataBrgScreen()));
                  } else if (value == 7) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  }
                },
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                menu_utama(),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    // Expanded(
                    //   flex: 6,
                    //   child: BarChartWidget(),
                    // ),
                    Expanded(
                      flex: 4,
                      child: PieChartWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                  Provider.of<LoginController>(context, listen: false)
                      .nama_staff),
              accountEmail: Text(
                  Provider.of<LoginController>(context, listen: false)
                      .email_staff),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? Colors.white
                        : Colors.blue,
                child: Text(
                  Provider.of<LoginController>(context, listen: false)
                      .nama_staff
                      .substring(0, 1)
                      .toUpperCase(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            PopupMenuButton(
              offset: const Offset(12, 55),
              color: Colors.blue[100],
              tooltip: "Menu Master",
              child: Container(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: const Text(
                        'MASTER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
              elevation: 2,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_staff.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("SP BAGIAN"),
                      ],
                    ),
                    value: 100,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_user_warna.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("SP BARANG"),
                      ],
                    ),
                    value: 101,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_loading.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("SP INVENTORI"),
                      ],
                    ),
                    value: 102,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_user.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("HRD PEGAWAI"),
                      ],
                    ),
                    value: 103,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_staff.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("HRD BAGIAN"),
                      ],
                    ),
                    value: 104,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_more.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("HRD BORONGAN"),
                      ],
                    ),
                    value: 105,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_more.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("HRD GRUP"),
                      ],
                    ),
                    value: 106,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_more.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("HRD MODEL"),
                      ],
                    ),
                    value: 107,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_more.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("PEMBELIAN SUPPLIER"),
                      ],
                    ),
                    value: 108,
                  ),
                  PopupMenuItem(
                    child: PopupMenuButton(
                      offset: const Offset(260, 0),
                      color: Colors.blue[100],
                      tooltip: "Menu Bahan",
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_more.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                            height: 50,
                          ),
                          Text("PEMBELIAN BAHAN"),
                        ],
                      ),
                      elevation: 4,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("BAHAN"),
                              ],
                            ),
                            value: 109,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("MESIN"),
                              ],
                            ),
                            value: 110,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("NON BAHAN"),
                              ],
                            ),
                            value: 111,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("SPAREPART"),
                              ],
                            ),
                            value: 112,
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        if (value == 109) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DataPemBahanScreen()));
                        } else if (value == 110) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DataMesinScreen()));
                        } else if (value == 111) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DataNonBahanScreen()));
                        } else if (value == 112) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DataSparepartScreen()));
                        }
                      },
                    ),
                  ),
                ];
              },
              onSelected: (value) async {
                if (value == 100) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataBagianScreen()));
                } else if (value == 101) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataBarangScreen()));
                } else if (value == 102) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataInventoriScreen()));
                } else if (value == 103) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataPegawaiScreen()));
                } else if (value == 104) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataHRDbagianScreen()));
                } else if (value == 105) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DataHRDboronganScreen()));
                } else if (value == 106) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataHRDgrupScreen()));
                } else if (value == 107) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DataHRDmodelScreen()));
                } else if (value == 108) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DataPemSupplierScreen()));
                }
              },
            ),
            PopupMenuButton(
              offset: const Offset(12, 55),
              color: Colors.blue[100],
              tooltip: "LAPORAN",
              child: Container(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: const Text(
                        'LAPORAN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
              elevation: 2,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: PopupMenuButton(
                      offset: const Offset(260, -30),
                      color: Colors.blue[100],
                      tooltip: "DAFTAR ABSEN",
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_more.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                            height: 50,
                          ),
                          Text("DAFTAR ABSEN"),
                        ],
                      ),
                      elevation: 4,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("HARIAN"),
                              ],
                            ),
                            value: 201,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("LEMBURAN"),
                              ],
                            ),
                            value: 202,
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        if (value == 201) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AbsenHarianScreen()));
                        } else if (value == 202) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AbsenLemburanScreen()));
                        }
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: PopupMenuButton(
                      offset: const Offset(260, -30),
                      color: Colors.blue[100],
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_more.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                            height: 50,
                          ),
                          Text("LEMBUR PER BAGIAN"),
                        ],
                      ),
                      elevation: 4,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("HARIAN"),
                              ],
                            ),
                            value: 211,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("BORONGAN"),
                              ],
                            ),
                            value: 212,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("PER JAM"),
                              ],
                            ),
                            value: 213,
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        if (value == 211) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LemburHarianScreen()));
                        } else if (value == 212) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LemburBoronganScreen()));
                        } else if (value == 213) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LemburPerjamScreen()));
                        }
                      },
                    ),
                  ),
                ];
              },
            ),
            PopupMenuButton(
              offset: const Offset(12, 55),
              color: Colors.blue[100],
              child: Container(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: const Text(
                        'TRANSAKSI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
              elevation: 2,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_more.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("HARIAN"),
                      ],
                    ),
                    value: 301,
                  ),
                  // PopupMenuItem(
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/ic_more.png",
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Text("KAS MASUK"),
                  //     ],
                  //   ),
                  //   value: 302,
                  // ),
                  // PopupMenuItem(
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/ic_more.png",
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Text("KAS KELUAR"),
                  //     ],
                  //   ),
                  //   value: 303,
                  // ),
                  // PopupMenuItem(
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/ic_more.png",
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Text("BANK MASUK"),
                  //     ],
                  //   ),
                  //   value: 304,
                  // ),
                  // PopupMenuItem(
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/ic_more.png",
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Text("BANK KELUAR"),
                  //     ],
                  //   ),
                  //   value: 305,
                  // ),
                  // PopupMenuItem(
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/ic_more.png",
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Text("MEMO"),
                  //     ],
                  //   ),
                  //   value: 306,
                  // ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/ic_more.png",
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("BORONGAN"),
                      ],
                    ),
                    value: 307,
                  ),
                  PopupMenuItem(
                    child: PopupMenuButton(
                      offset: const Offset(260, -30),
                      color: Colors.blue[100],
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_more.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                            height: 50,
                          ),
                          Text("KIK"),
                        ],
                      ),
                      elevation: 4,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/ic_more.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("JAHIT"),
                              ],
                            ),
                            value: 308,
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        if (value == 308) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => KikJahitScreen()));
                        }
                      },
                    ),
                  ),
                ];
              },
              onSelected: (value) async {
                if (value == 301) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HarianScreen()));
                  // } else if (value == 302) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (_) => KasMasukScreen()));
                  // } else if (value == 303) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (_) => KasKeluarScreen()));
                  // } else if (value == 304) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (_) => BankMasukScreen()));
                  // } else if (value == 305) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (_) => BankKeluarScreen()));
                  // } else if (value == 306) {
                  //   Navigator.push(
                  //       context, MaterialPageRoute(builder: (_) => MemoScreen()));
                } else if (value == 307) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BoronganScreen()));
                }
              },
            ),
          ],
        )),
      );
    });
  }

  Widget menu_utama() {
    double size = (MediaQuery.of(context).size.width - 160) / 4;
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Row(
        children: [
          SizedBox(
            width: 32,
          ),

          //TRANSAKSI STOK
          OnHoverButton(
            child: InkWell(
              // onTap: () {
              //   if (Provider.of<LoginController>(context, listen: false)
              //           .ROLE !=
              //       2) {
              //   Navigator.push(context,
              //           MaterialPageRoute(builder: (_) => DataStokScreen()))
              //       .then((value) {
              //     if (Provider.of<LoginController>(context, listen: false)
              //             .ROLE ==
              //         2) {
              //       homeController.baca_allData(3);
              //     }
              //   });
              //   } else {
              //     Toast("No Access", "Hanya bisa diakses Manajer & Staff PJL",
              //         false);
              //   }
              // },
              child: Container(
                width: size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AbuColor),
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Image.asset(
                        "assets/images/ic_po.png",
                        height: 50,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Transaksi Stok",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        homeController.po_count.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Increased 0%",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AbuColor),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 32,
          ),

          //TRANSAKSI PO
          OnHoverButton(
            child: InkWell(
              child: Container(
                width: size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AbuColor),
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Image.asset(
                        "assets/images/ic_pembelian.png",
                        height: 50,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Purchase Order",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        homeController.buy_count.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Increased 0%",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AbuColor),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 32,
          ),

          //TRANSAKSI PENERIMAAN
          OnHoverButton(
            child: InkWell(
              // onTap: () {
              //   if (Provider.of<LoginController>(context, listen: false)
              //           .ROLE !=
              //       2) {
              //   Navigator.push(context,
              //           MaterialPageRoute(builder: (_) => PenerimaanScreen()))
              //       .then((value) {
              //     if (Provider.of<LoginController>(context, listen: false)
              //             .ROLE ==
              //         2) {
              //       homeController.baca_allData(3);
              //     }
              //   });
              //   } else {
              //     Toast("No Access", "Hanya bisa diakses Manajer & Staff PJL",
              //         false);
              //   }
              // },
              child: Container(
                width: size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AbuColor),
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Image.asset(
                        "assets/images/ic_so.png",
                        height: 50,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Transaksi Penerimaan",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        homeController.so_count.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Increased 0%",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AbuColor),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 32,
          ),

          //KAS MASUK
          OnHoverButton(
            child: InkWell(
              // onTap: () {
              //   if (Provider.of<LoginController>(context, listen: false)
              //           .ROLE !=
              //       2) {
              //   Navigator.push(context,
              //           MaterialPageRoute(builder: (_) => KasMasukScreen()))
              //       .then((value) {
              //     if (Provider.of<LoginController>(context, listen: false)
              //             .ROLE ==
              //         3) {
              //       homeController.baca_allData(2);
              //     }
              //   });
              //   } else {
              //     Toast("No Access", "Hanya bisa diakses Manajer & Staff PJL",
              //         false);
              //   }
              // },
              child: Container(
                width: size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AbuColor),
                  boxShadow: [
                    BoxShadow(
                      color: GreyColor,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Image.asset(
                        "assets/images/ic_penjualan.png",
                        height: 50,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Kas Masuk",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        homeController.sale_count.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Increased 0%",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AbuColor),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 32,
          ),
        ],
      );
    });
  }
}
