import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:dragon/controller/account_controller.dart';
import 'package:dragon/controller/pilih_bagian_controller.dart';
import 'package:dragon/controller/pilih_grup_controller.dart';
import 'package:dragon/controller/master/sp_bagian_controller.dart';
import 'package:dragon/controller/master/sp_barang_controller.dart';
import 'package:dragon/controller/master/sp_inventori_controller.dart';
import 'package:dragon/controller/master/hrd_pegawai_controller.dart';
import 'package:dragon/controller/master/hrd_bagian_controller.dart';
import 'package:dragon/controller/master/hrd_borongan_controller.dart';
import 'package:dragon/controller/master/hrd_grup_controller.dart';
import 'package:dragon/controller/master/hrd_model_controller.dart';
import 'package:dragon/controller/master/pembelian_supplier_controller.dart';
import 'package:dragon/controller/master/pembelian_bahan_controller.dart';
import 'package:dragon/controller/master/pembelian_nonbahan_controller.dart';
import 'package:dragon/controller/master/pembelian_mesin_controller.dart';
import 'package:dragon/controller/master/pembelian_sparepart_controller.dart';
import 'package:dragon/controller/laporan/absen_harian_controller.dart';
import 'package:dragon/controller/laporan/absen_lemburan_controller.dart';
import 'package:dragon/controller/laporan/lembur_harian_controller.dart';
import 'package:dragon/controller/laporan/lembur_borongan_controller.dart';
import 'package:dragon/controller/laporan/lembur_perjam_controller.dart';
import 'package:dragon/controller/transaksi/kasmasuk_controller.dart';
import 'package:dragon/controller/transaksi/kaskeluar_controller.dart';
import 'package:dragon/controller/transaksi/bankmasuk_controller.dart';
import 'package:dragon/controller/transaksi/bankkeluar_controller.dart';
import 'package:dragon/controller/transaksi/memo_controller.dart';
import 'package:dragon/controller/transaksi/harian_controller.dart';
import 'package:dragon/controller/transaksi/borongan_controller.dart';
import 'package:dragon/controller/transaksi/kik_jahit_controller.dart';
import 'package:dragon/controller/home_controller.dart';
import 'package:dragon/controller/login_controller.dart';
import 'package:dragon/view/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'controller/laporan/absen_harian_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Provider
  sl.registerFactory(() => HomeController());
  sl.registerFactory(() => AccountController());
  sl.registerFactory(() => PilihBagianController());
  sl.registerFactory(() => PilihGrupController());
  sl.registerFactory(() => SP_BagianController());
  sl.registerFactory(() => SP_Barang_Controller());
  sl.registerFactory(() => SP_InventoriController());
  sl.registerFactory(() => HRD_PegawaiController());
  sl.registerFactory(() => HRD_BagianController());
  sl.registerFactory(() => HRD_BoronganController());
  sl.registerFactory(() => HRD_GrupController());
  sl.registerFactory(() => HRD_ModelController());
  sl.registerFactory(() => Pembelian_SupplierController());
  sl.registerFactory(() => Pembelian_BahanController());
  sl.registerFactory(() => Pembelian_NonbahanController());
  sl.registerFactory(() => Pembelian_MesinController());
  sl.registerFactory(() => Pembelian_SparepartController());
  sl.registerFactory(() => AbsenHarianController());
  sl.registerFactory(() => AbsenLemburanController());
  sl.registerFactory(() => LemburHarianController());
  sl.registerFactory(() => LemburBoronganController());
  sl.registerFactory(() => LemburPerjamController());
  sl.registerFactory(() => KasmasukController());
  sl.registerFactory(() => KaskeluarController());
  sl.registerFactory(() => BankmasukController());
  sl.registerFactory(() => BankkeluarController());
  sl.registerFactory(() => MemoController());
  sl.registerFactory(() => HarianController());
  sl.registerFactory(() => BoronganController());
  sl.registerFactory(() => KikJahitController());
  sl.registerFactory(() => LoginController());
}

Future<void> main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) =>
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => sl<HomeController>()),
          ChangeNotifierProvider(create: (context) => sl<AccountController>()),
          ChangeNotifierProvider(
              create: (context) => sl<PilihBagianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<PilihGrupController>()),
          ChangeNotifierProvider(
              create: (context) => sl<SP_BagianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<SP_Barang_Controller>()),
          ChangeNotifierProvider(
              create: (context) => sl<SP_InventoriController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_PegawaiController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_BagianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_BoronganController>()),
          ChangeNotifierProvider(create: (context) => sl<HRD_GrupController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_ModelController>()),
          ChangeNotifierProvider(
              create: (context) => sl<Pembelian_SupplierController>()),
          ChangeNotifierProvider(
              create: (context) => sl<Pembelian_BahanController>()),
          ChangeNotifierProvider(
              create: (context) => sl<Pembelian_NonbahanController>()),
          ChangeNotifierProvider(
              create: (context) => sl<Pembelian_MesinController>()),
          ChangeNotifierProvider(
              create: (context) => sl<Pembelian_SparepartController>()),
          ChangeNotifierProvider(
              create: (context) => sl<AbsenHarianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<AbsenLemburanController>()),
          ChangeNotifierProvider(
              create: (context) => sl<LemburHarianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<LemburBoronganController>()),
          ChangeNotifierProvider(
              create: (context) => sl<LemburPerjamController>()),
          ChangeNotifierProvider(create: (context) => sl<KasmasukController>()),
          ChangeNotifierProvider(
              create: (context) => sl<KaskeluarController>()),
          ChangeNotifierProvider(
              create: (context) => sl<BankmasukController>()),
          ChangeNotifierProvider(
              create: (context) => sl<BankkeluarController>()),
          ChangeNotifierProvider(create: (context) => sl<MemoController>()),
          ChangeNotifierProvider(create: (context) => sl<HarianController>()),
          ChangeNotifierProvider(create: (context) => sl<BoronganController>()),
          ChangeNotifierProvider(create: (context) => sl<KikJahitController>()),
          ChangeNotifierProvider(create: (context) => sl<LoginController>()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PT. INTIDRAGON SURYATAMA",
      theme: theme(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
