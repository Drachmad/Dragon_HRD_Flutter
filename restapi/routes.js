'use strict';

module.exports = function (app) {
    var jsonku = require('./controller');
    var master = require('./master/controller');

    app.route('/')
        .get(jsonku.index);
    app.route('/login')
        .post(jsonku.login);
    app.route('/indeks_account')
        .post(jsonku.tampil_account);
    app.route('/indeks_pegawai')
        .post(jsonku.tampil_pegawai);
    app.route('/indeks_kik')
        .post(jsonku.tampil_kik);
    app.route('/indeks_premi')
        .post(jsonku.tampil_premi);


    // ================Widget Pilih==================
    app.route('/data_bagian')
        .post(jsonku.data_bagian);
    app.route('/data_grup')
        .post(jsonku.data_grup);

    //==================MASTER======================= 
    app.route('/sp_bagian_paginate')
        .post(jsonku.sp_bagian_paginate);
    app.route('/count_sp_bagian_paginate')
        .post(jsonku.count_sp_bagian_paginate);
    app.route('/tambah_sp_bagian')
        .post(jsonku.tambah_sp_bagian);
    app.route('/ubah_sp_bagian')
        .post(jsonku.ubah_sp_bagian);
    app.route('/hapus_sp_bagian')
        .post(jsonku.hapus_sp_bagian);

    app.route('/sp_barang_paginate')
        .post(jsonku.sp_barang_paginate);
    app.route('/count_sp_barang_paginate')
        .post(jsonku.count_sp_barang_paginate);
    app.route('/tambah_sp_barang')
        .post(jsonku.tambah_sp_barang);
    app.route('/ubah_sp_barang')
        .post(jsonku.ubah_sp_barang);
    app.route('/hapus_sp_barang')
        .post(jsonku.hapus_sp_barang);

    app.route('/sp_inventori_paginate')
        .post(jsonku.sp_inventori_paginate);
    app.route('/count_sp_inventori_paginate')
        .post(jsonku.count_sp_inventori_paginate);
    app.route('/tambah_sp_inventori')
        .post(jsonku.tambah_sp_inventori);
    app.route('/ubah_sp_inventori')
        .post(jsonku.ubah_sp_inventori);
    app.route('/hapus_sp_inventori')
        .post(jsonku.hapus_sp_inventori);

    app.route('/hrd_pegawai_paginate')
        .post(master.hrd_pegawai_paginate);
    app.route('/count_hrd_pegawai_paginate')
        .post(master.count_hrd_pegawai_paginate);
    app.route('/tambah_hrd_pegawai')
        .post(master.tambah_hrd_pegawai);
    app.route('/ubah_hrd_pegawai')
        .post(master.ubah_hrd_pegawai);
    app.route('/hapus_hrd_pegawai')
        .post(master.hapus_hrd_pegawai);

    app.route('/hrd_bagian_paginate')
        .post(master.hrd_bagian_paginate);
    app.route('/count_hrd_bagian_paginate')
        .post(master.count_hrd_bagian_paginate);
    app.route('/tambah_hrd_bagian')
        .post(master.tambah_hrd_bagian);
    app.route('/ubah_hrd_bagian')
        .post(master.ubah_hrd_bagian);
    app.route('/hapus_hrd_bagian')
        .post(master.hapus_hrd_bagian);

    app.route('/hrd_borongan_paginate')
        .post(master.hrd_borongan_paginate);
    app.route('/count_hrd_borongan_paginate')
        .post(master.count_hrd_borongan_paginate);
    app.route('/tambah_hrd_borongan')
        .post(master.tambah_hrd_borongan);
    app.route('/ubah_hrd_borongan')
        .post(master.ubah_hrd_borongan);
    app.route('/hapus_hrd_borongan')
        .post(master.hapus_hrd_borongan);

    app.route('/hrd_grup_paginate')
        .post(master.hrd_grup_paginate);
    app.route('/count_hrd_grup_paginate')
        .post(master.count_hrd_grup_paginate);
    app.route('/tambah_hrd_grup')
        .post(master.tambah_hrd_grup);
    app.route('/ubah_hrd_grup')
        .post(master.ubah_hrd_grup);
    app.route('/hapus_hrd_grup')
        .post(master.hapus_hrd_grup);

    app.route('/hrd_model_paginate')
        .post(master.hrd_model_paginate);
    app.route('/count_hrd_model_paginate')
        .post(master.count_hrd_model_paginate);
    app.route('/tambah_header_hrd_model')
        .post(master.tambah_header_hrd_model);
    app.route('/tambah_detail_hrd_model')
        .post(master.tambah_detail_hrd_model);
    app.route('/ubah_header_hrd_model')
        .post(master.ubah_header_hrd_model);
    app.route('/hapus_hrd_model')
        .post(master.hapus_hrd_model);

    app.route('/pembelian_supplier_paginate')
        .post(jsonku.pembelian_supplier_paginate);
    app.route('/count_pembelian_supplier_paginate')
        .post(jsonku.count_pembelian_supplier_paginate);
    app.route('/tambah_pembelian_supplier')
        .post(jsonku.tambah_pembelian_supplier);
    app.route('/ubah_pembelian_supplier')
        .post(jsonku.ubah_pembelian_supplier);
    app.route('/hapus_pembelian_supplier')
        .post(jsonku.hapus_pembelian_supplier);

    app.route('/pembelian_bahan_paginate')
        .post(jsonku.pembelian_bahan_paginate);
    app.route('/count_pembelian_bahan_paginate')
        .post(jsonku.count_pembelian_bahan_paginate);
    app.route('/tambah_pembelian_bahan')
        .post(jsonku.tambah_pembelian_bahan);
    app.route('/ubah_pembelian_bahan')
        .post(jsonku.ubah_pembelian_bahan);
    app.route('/hapus_pembelian_bahan')
        .post(jsonku.hapus_pembelian_bahan);

    app.route('/pembelian_nonbahan_paginate')
        .post(jsonku.pembelian_nonbahan_paginate);
    app.route('/count_pembelian_nonbahan_paginate')
        .post(jsonku.count_pembelian_nonbahan_paginate);
    app.route('/tambah_pembelian_nonbahan')
        .post(jsonku.tambah_pembelian_nonbahan);
    app.route('/ubah_pembelian_nonbahan')
        .post(jsonku.ubah_pembelian_nonbahan);
    app.route('/hapus_pembelian_nonbahan')
        .post(jsonku.hapus_pembelian_nonbahan);

    app.route('/pembelian_sparepart_paginate')
        .post(jsonku.pembelian_sparepart_paginate);
    app.route('/count_pembelian_sparepart_paginate')
        .post(jsonku.count_pembelian_sparepart_paginate);
    app.route('/tambah_pembelian_sparepart')
        .post(jsonku.tambah_pembelian_sparepart);
    app.route('/ubah_pembelian_sparepart')
        .post(jsonku.ubah_pembelian_sparepart);
    app.route('/hapus_pembelian_sparepart')
        .post(jsonku.hapus_pembelian_sparepart);

    app.route('/pembelian_mesin_paginate')
        .post(jsonku.pembelian_mesin_paginate);
    app.route('/count_pembelian_mesin_paginate')
        .post(jsonku.count_pembelian_mesin_paginate);
    app.route('/tambah_pembelian_mesin')
        .post(jsonku.tambah_pembelian_mesin);
    app.route('/ubah_pembelian_mesin')
        .post(jsonku.ubah_pembelian_mesin);
    app.route('/hapus_pembelian_mesin')
        .post(jsonku.hapus_pembelian_mesin);

    ///LAPORAN ABSEN HARIAN
    app.route('/lap_absen_harian')
        .post(jsonku.lap_absen_harian);
    ///LAPORAN ABSEN LEMBUR
    app.route('/lap_absen_lemburan')
        .post(jsonku.lap_absen_lemburan);
    ///LAPORAN LEMBUR HARIAN
    app.route('/lap_lembur_harian')
        .post(jsonku.lap_lembur_harian);
    ///LAPORAN LEMBUR BORONGAN
    app.route('/lap_lembur_borongan')
        .post(jsonku.lap_lembur_borongan);
    ///LAPORAN LEMBUR PER JAM
    app.route('/lap_lembur_perjam')
        .post(jsonku.lap_lembur_perjam);
    app.route('/lap_gaji_harian')
        .post(jsonku.lap_gaji_harian);

    // =====================TRANSAKSI========================
    ///TRANSAKSI HEADER DETAIL HARIAN
    app.route('/harian_paginate')
        .post(jsonku.harian_paginate);
    app.route('/count_harian_paginate')
        .post(jsonku.count_harian_paginate);
    app.route('/tambah_header_harian')
        .post(jsonku.tambah_header_harian);
    app.route('/hapus_harian')
        .post(jsonku.hapus_harian);
    app.route('/tambah_detail_harian')
        .post(jsonku.tambah_detail_harian);
    app.route('/edit_header_harian')
        .post(jsonku.edit_header_harian);

    ///TRANSAKSI HEADER DETAIL BORONGAN
    app.route('/borongan_paginate')
        .post(jsonku.borongan_paginate);
    app.route('/count_borongan_paginate')
        .post(jsonku.count_borongan_paginate);
    app.route('/tambah_header_borongan')
        .post(jsonku.tambah_header_borongan);
    app.route('/hapus_borongan')
        .post(jsonku.hapus_borongan);
    app.route('/tambah_detail_borongan')
        .post(jsonku.tambah_detail_borongan);
    app.route('/edit_header_borongan')
        .post(jsonku.edit_header_borongan);

    ///TRANSAKSI HEADER DETAIL KIK JAHIT
    app.route('/kik_jahit_paginate')
        .post(jsonku.kik_jahit_paginate);
    app.route('/count_kik_jahit_paginate')
        .post(jsonku.count_kik_jahit_paginate);
    app.route('/tambah_header_kik_jahit')
        .post(jsonku.tambah_header_kik_jahit);
    app.route('/hapus_kik_jahit')
        .post(jsonku.hapus_kik_jahit);
    app.route('/tambah_detail_kik_jahit')
        .post(jsonku.tambah_detail_kik_jahit);
    app.route('/edit_header_kik_jahit')
        .post(jsonku.edit_header_kik_jahit);
    app.route('/urut_nobukti_kik_jahit')
        .post(jsonku.urut_nobukti_kik_jahit);

    ///TRANSAKSI HEADER DETAIL KIK JUKI
    app.route('/kik_juki_paginate')
        .post(jsonku.kik_juki_paginate);
    app.route('/count_kik_juki_paginate')
        .post(jsonku.count_kik_juki_paginate);
    app.route('/tambah_header_kik_juki')
        .post(jsonku.tambah_header_kik_juki);
    app.route('/hapus_kik_juki')
        .post(jsonku.hapus_kik_juki);
    app.route('/tambah_detail_kik_juki')
        .post(jsonku.tambah_detail_kik_juki);
    app.route('/edit_header_kik_juki')
        .post(jsonku.edit_header_kik_juki);
    app.route('/urut_nobukti_kik_juki')
        .post(jsonku.urut_nobukti_kik_juki);

    ///TRANSAKSI HEADER DETAIL KIK KSP
    app.route('/kik_ksp_paginate')
        .post(jsonku.kik_ksp_paginate);
    app.route('/count_kik_ksp_paginate')
        .post(jsonku.count_kik_ksp_paginate);
    app.route('/tambah_header_kik_ksp')
        .post(jsonku.tambah_header_kik_ksp);
    app.route('/hapus_kik_ksp')
        .post(jsonku.hapus_kik_ksp);
    app.route('/tambah_detail_kik_ksp')
        .post(jsonku.tambah_detail_kik_ksp);
    app.route('/edit_header_kik_ksp')
        .post(jsonku.edit_header_kik_ksp);
    app.route('/urut_nobukti_kik_ksp')
        .post(jsonku.urut_nobukti_kik_ksp);

    ///TRANSAKSI HEADER DETAIL KIK PACKING
    app.route('/kik_packing_paginate')
        .post(jsonku.kik_packing_paginate);
    app.route('/count_kik_packing_paginate')
        .post(jsonku.count_kik_packing_paginate);
    app.route('/tambah_header_kik_packing')
        .post(jsonku.tambah_header_kik_packing);
    app.route('/hapus_kik_packing')
        .post(jsonku.hapus_kik_packing);
    app.route('/tambah_detail_kik_packing')
        .post(jsonku.tambah_detail_kik_packing);
    app.route('/edit_header_kik_packing')
        .post(jsonku.edit_header_kik_packing);
    app.route('/urut_nobukti_kik_packing')
        .post(jsonku.urut_nobukti_kik_packing);

    ///TRANSAKSI HEADER DETAIL KIK PLONG
    app.route('/kik_plong_paginate')
        .post(jsonku.kik_plong_paginate);
    app.route('/count_kik_plong_paginate')
        .post(jsonku.count_kik_plong_paginate);
    app.route('/tambah_header_kik_plong')
        .post(jsonku.tambah_header_kik_plong);
    app.route('/hapus_kik_plong')
        .post(jsonku.hapus_kik_plong);
    app.route('/tambah_detail_kik_plong')
        .post(jsonku.tambah_detail_kik_plong);
    app.route('/edit_header_kik_plong')
        .post(jsonku.edit_header_kik_plong);
    app.route('/urut_nobukti_kik_plong')
        .post(jsonku.urut_nobukti_kik_plong);

    ///TRANSAKSI HEADER DETAIL KIK SABLON
    app.route('/kik_sablon_paginate')
        .post(jsonku.kik_sablon_paginate);
    app.route('/count_kik_sablon_paginate')
        .post(jsonku.count_kik_sablon_paginate);
    app.route('/tambah_header_kik_sablon')
        .post(jsonku.tambah_header_kik_sablon);
    app.route('/hapus_kik_sablon')
        .post(jsonku.hapus_kik_sablon);
    app.route('/tambah_detail_kik_sablon')
        .post(jsonku.tambah_detail_kik_sablon);
    app.route('/edit_header_kik_sablon')
        .post(jsonku.edit_header_kik_sablon);
    app.route('/urut_nobukti_kik_sablon')
        .post(jsonku.urut_nobukti_kik_sablon);

    ///TRANSAKSI HEADER DETAIL KIK INJECTION
    app.route('/kik_injection_paginate')
        .post(jsonku.kik_injection_paginate);
    app.route('/count_kik_injection_paginate')
        .post(jsonku.count_kik_injection_paginate);
    app.route('/tambah_header_kik_injection')
        .post(jsonku.tambah_header_kik_injection);
    app.route('/hapus_kik_injection')
        .post(jsonku.hapus_kik_injection);
    app.route('/tambah_detail_kik_injection')
        .post(jsonku.tambah_detail_kik_injection);
    app.route('/edit_header_kik_injection')
        .post(jsonku.edit_header_kik_injection);
    app.route('/urut_nobukti_kik_injection')
        .post(jsonku.urut_nobukti_kik_injection);

    ///TRANSAKSI HEADER DETAIL KIK ASSEMBLING
    app.route('/kik_assembling_paginate')
        .post(jsonku.kik_assembling_paginate);
    app.route('/count_kik_assembling_paginate')
        .post(jsonku.count_kik_assembling_paginate);
    app.route('/tambah_header_kik_assembling')
        .post(jsonku.tambah_header_kik_assembling);
    app.route('/hapus_kik_assembling')
        .post(jsonku.hapus_kik_assembling);
    app.route('/tambah_detail_kik_assembling')
        .post(jsonku.tambah_detail_kik_assembling);
    app.route('/edit_header_kik_assembling')
        .post(jsonku.edit_header_kik_assembling);
    app.route('/urut_nobukti_kik_assembling')
        .post(jsonku.urut_nobukti_kik_assembling);

    ///TRANSAKSI HEADER DETAIL KIK CAT SPRAY
    app.route('/kik_catspray_paginate')
        .post(jsonku.kik_catspray_paginate);
    app.route('/count_kik_catspray_paginate')
        .post(jsonku.count_kik_catspray_paginate);
    app.route('/tambah_header_kik_catspray')
        .post(jsonku.tambah_header_kik_catspray);
    app.route('/hapus_kik_catspray')
        .post(jsonku.hapus_kik_catspray);
    app.route('/tambah_detail_kik_catspray')
        .post(jsonku.tambah_detail_kik_catspray);
    app.route('/edit_header_kik_catspray')
        .post(jsonku.edit_header_kik_catspray);
    app.route('/urut_nobukti_kik_catspray')
        .post(jsonku.urut_nobukti_kik_catspray);

    ///TRANSAKSI HEADER DETAIL KIK COMPOUND
    app.route('/kik_compound_paginate')
        .post(jsonku.kik_compound_paginate);
    app.route('/count_kik_compound_paginate')
        .post(jsonku.count_kik_compound_paginate);
    app.route('/tambah_header_kik_compound')
        .post(jsonku.tambah_header_kik_compound);
    app.route('/hapus_kik_compound')
        .post(jsonku.hapus_kik_compound);
    app.route('/tambah_detail_kik_compound')
        .post(jsonku.tambah_detail_kik_compound);
    app.route('/edit_header_kik_compound')
        .post(jsonku.edit_header_kik_compound);
    app.route('/urut_nobukti_kik_compound')
        .post(jsonku.urut_nobukti_kik_compound);

    ///TRANSAKSI HEADER DETAIL KIK FLOCKING
    app.route('/kik_flocking_paginate')
        .post(jsonku.kik_flocking_paginate);
    app.route('/count_kik_flocking_paginate')
        .post(jsonku.count_kik_flocking_paginate);
    app.route('/tambah_header_kik_flocking')
        .post(jsonku.tambah_header_kik_flocking);
    app.route('/hapus_kik_flocking')
        .post(jsonku.hapus_kik_flocking);
    app.route('/tambah_detail_kik_flocking')
        .post(jsonku.tambah_detail_kik_flocking);
    app.route('/edit_header_kik_flocking')
        .post(jsonku.edit_header_kik_flocking);
    app.route('/urut_nobukti_kik_flocking')
        .post(jsonku.urut_nobukti_kik_flocking);

    ///TRANSAKSI HEADER DETAIL KIK STRONG
    app.route('/kik_strong_paginate')
        .post(jsonku.kik_strong_paginate);
    app.route('/count_kik_strong_paginate')
        .post(jsonku.count_kik_strong_paginate);
    app.route('/tambah_header_kik_strong')
        .post(jsonku.tambah_header_kik_strong);
    app.route('/hapus_kik_strong')
        .post(jsonku.hapus_kik_strong);
    app.route('/tambah_detail_kik_strong')
        .post(jsonku.tambah_detail_kik_strong);
    app.route('/edit_header_kik_strong')
        .post(jsonku.edit_header_kik_strong);
    app.route('/urut_nobukti_kik_strong')
        .post(jsonku.urut_nobukti_kik_strong);

    ///TRANSAKSI HEADER DETAIL KIK MICRO
    app.route('/kik_micro_paginate')
        .post(jsonku.kik_micro_paginate);
    app.route('/count_kik_micro_paginate')
        .post(jsonku.count_kik_micro_paginate);
    app.route('/tambah_header_kik_micro')
        .post(jsonku.tambah_header_kik_micro);
    app.route('/hapus_kik_micro')
        .post(jsonku.hapus_kik_micro);
    app.route('/tambah_detail_kik_micro')
        .post(jsonku.tambah_detail_kik_micro);
    app.route('/edit_header_kik_micro')
        .post(jsonku.edit_header_kik_micro);
    app.route('/urut_nobukti_kik_micro')
        .post(jsonku.urut_nobukti_kik_micro);

    ///TRANSAKSI HEADER DETAIL KIK DR2
    app.route('/kik_dr2_paginate')
        .post(jsonku.kik_dr2_paginate);
    app.route('/count_kik_dr2_paginate')
        .post(jsonku.count_kik_dr2_paginate);
    app.route('/tambah_header_kik_dr2')
        .post(jsonku.tambah_header_kik_dr2);
    app.route('/hapus_kik_dr2')
        .post(jsonku.hapus_kik_dr2);
    app.route('/tambah_detail_kik_dr2')
        .post(jsonku.tambah_detail_kik_dr2);
    app.route('/edit_header_kik_dr2')
        .post(jsonku.edit_header_kik_dr2);
    app.route('/urut_nobukti_kik_dr2')
        .post(jsonku.urut_nobukti_kik_dr2);

    ///TRANSAKSI HEADER DETAIL PREMI PSP
    app.route('/premi_psp_paginate')
        .post(jsonku.premi_psp_paginate);
    app.route('/count_premi_psp_paginate')
        .post(jsonku.count_premi_psp_paginate);
    app.route('/tambah_header_premi_psp')
        .post(jsonku.tambah_header_premi_psp);
    app.route('/hapus_premi_psp')
        .post(jsonku.hapus_premi_psp);
    app.route('/tambah_detail_premi_psp')
        .post(jsonku.tambah_detail_premi_psp);
    app.route('/edit_header_premi_psp')
        .post(jsonku.edit_header_premi_psp);
    app.route('/urut_nobukti_premi_psp')
        .post(jsonku.urut_nobukti_premi_psp);

    ///TRANSAKSI HEADER DETAIL KAS
    app.route('/tambah_header_kas')
        .post(jsonku.tambah_header_kas);
    app.route('/tambah_detail_kas')
        .post(jsonku.tambah_detail_kas);
    app.route('/tampil_kas_masuk')
        .post(jsonku.tampil_kas_masuk);
    app.route('/tampil_kas_keluar')
        .post(jsonku.tampil_kas_keluar);
    app.route('/edit_header_kas')
        .post(jsonku.edit_header_kas);
    app.route('/hapus_header_kas')
        .post(jsonku.hapus_header_kas);
    app.route('/hapus_detail_kas')
        .post(jsonku.hapus_detail_kas);
    ///TRANSAKSI HEADER DETAIL BANK
    app.route('/tambah_header_bank')
        .post(jsonku.tambah_header_bank);
    app.route('/tambah_detail_bank')
        .post(jsonku.tambah_detail_bank);
    app.route('/tampil_bank_masuk')
        .post(jsonku.tampil_bank_masuk);
    app.route('/tampil_bank_keluar')
        .post(jsonku.tampil_bank_keluar);
    app.route('/edit_header_bank')
        .post(jsonku.edit_header_bank);
    ///TRANSAKSI HEADER DETAIL MEMO
    app.route('/tambah_header_memo')
        .post(jsonku.tambah_header_memo);
    app.route('/tambah_detail_memo')
        .post(jsonku.tambah_detail_memo);
    app.route('/tampil_memo')
        .post(jsonku.tampil_memo);
    app.route('/edit_header_memo')
        .post(jsonku.edit_header_memo);

    /// MODAL
    //modal data account header kas
    app.route('/modal_acc_kas')
        .post(jsonku.modal_acc_kas);
    //modal data account header bank
    app.route('/modal_acc_bank')
        .post(jsonku.modal_acc_bank);
    ///SELECT DETAIL
    app.route('/select_detail')
        .post(jsonku.select_detail);
    ///HAPUS DETAIL
    app.route('/hapus_detail')
        .post(jsonku.hapus_detail);
    ///NO URUT
    app.route('/no_urut')
        .post(jsonku.no_urut);
    ///CHECK NO BUKTI
    app.route('/check_no_bukti')
        .post(jsonku.check_no_bukti);

}

