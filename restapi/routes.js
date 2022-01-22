'use strict';

module.exports = function (app) {
    var jsonku = require('./controller');

    app.route('/')
        .get(jsonku.index);
    app.route('/login')
        .post(jsonku.login);
    app.route('/indeks_account')
        .post(jsonku.tampil_account);
    app.route('/indeks_pegawai')
        .post(jsonku.tampil_pegawai);



    // ================Widget Pilih==================
    app.route('/data_bagian')
        .post(jsonku.data_bagian);

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
        .post(jsonku.hrd_pegawai_paginate);
    app.route('/count_hrd_pegawai_paginate')
        .post(jsonku.count_hrd_pegawai_paginate);
    app.route('/tambah_hrd_pegawai')
        .post(jsonku.tambah_hrd_pegawai);
    app.route('/ubah_hrd_pegawai')
        .post(jsonku.ubah_hrd_pegawai);
    app.route('/hapus_hrd_pegawai')
        .post(jsonku.hapus_hrd_pegawai);

    app.route('/hrd_bagian_paginate')
        .post(jsonku.hrd_bagian_paginate);
    app.route('/count_hrd_bagian_paginate')
        .post(jsonku.count_hrd_bagian_paginate);
    app.route('/tambah_hrd_bagian')
        .post(jsonku.tambah_hrd_bagian);
    app.route('/ubah_hrd_bagian')
        .post(jsonku.ubah_hrd_bagian);
    app.route('/hapus_hrd_bagian')
        .post(jsonku.hapus_hrd_bagian);

    app.route('/hrd_borongan_paginate')
        .post(jsonku.hrd_borongan_paginate);
    app.route('/count_hrd_borongan_paginate')
        .post(jsonku.count_hrd_borongan_paginate);
    app.route('/tambah_hrd_borongan')
        .post(jsonku.tambah_hrd_borongan);
    app.route('/ubah_hrd_borongan')
        .post(jsonku.ubah_hrd_borongan);
    app.route('/hapus_hrd_borongan')
        .post(jsonku.hapus_hrd_borongan);

    app.route('/hrd_grup_paginate')
        .post(jsonku.hrd_grup_paginate);
    app.route('/count_hrd_grup_paginate')
        .post(jsonku.count_hrd_grup_paginate);
    app.route('/tambah_hrd_grup')
        .post(jsonku.tambah_hrd_grup);
    app.route('/ubah_hrd_grup')
        .post(jsonku.ubah_hrd_grup);
    app.route('/hapus_hrd_grup')
        .post(jsonku.hapus_hrd_grup);

    app.route('/hrd_model_paginate')
        .post(jsonku.hrd_model_paginate);
    app.route('/count_hrd_model_paginate')
        .post(jsonku.count_hrd_model_paginate);
    app.route('/tambah_hrd_model')
        .post(jsonku.tambah_hrd_model);
    app.route('/ubah_hrd_model')
        .post(jsonku.ubah_hrd_model);
    app.route('/hapus_hrd_model')
        .post(jsonku.hapus_hrd_model);

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

