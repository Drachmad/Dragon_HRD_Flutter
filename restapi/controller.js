
'use strict';

var response = require('./res');
var connection = require('./koneksi');
var md5 = require('md5');

exports.index = function (req, res) {
    response.ok('aplikasi rest api berjalan', res)
};
exports.login = function (req, res) {
    var username = req.body.username;
    var password = md5(req.body.password);
    connection.query("select * from users where USERNAME = ? and PASSWORD = ? ", [username, password], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

//menampilkan Data Account
exports.tampil_account = function (req, res) {
    connection.query("select * from account",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
}

//menampilkan Data PEGAWAI
exports.tampil_pegawai = function (req, res) {
    connection.query("select * from hrd_peg",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
}

//menampilkan Data KIK
exports.tampil_kik = function (req, res) {
    var kik_grup = req.body.kik_grup;
    connection.query("SELECT gd_kik.no_kik, hrd_modeld.model, gd_kik.qty, hrd_modeld.upah, hrd_modeld.urut_ke, hrd_modeld.kode, hrd_modeld.item, hrd_modeld.des1 FROM gd_kik, hrd_modeld WHERE gd_kik.model_bsg = hrd_modeld.model AND hrd_modeld.proses = ? AND hrd_modeld.dr = 'i' GROUP BY gd_kik.no_kik, hrd_modeld.upah", [kik_grup],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
}

//menampilkan Data Premi
exports.tampil_premi = function (req, res) {
    var kik_grup = req.body.kik_grup;
    connection.query("SELECT gd_kik.no_kik, hrd_modeld.model, gd_kik.qty, hrd_modeld.upah, hrd_modeld.urut_ke, hrd_modeld.kode, hrd_modeld.item, hrd_modeld.des1 FROM gd_kik, hrd_modeld WHERE gd_kik.model_bsg = hrd_modeld.model AND hrd_modeld.proses = ? AND hrd_modeld.dr = 'i' GROUP BY gd_kik.no_kik, hrd_modeld.upah", [kik_grup],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
}


// ==========================================================================
///Data Bagian
exports.data_bagian = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select * from hrd_bag WHERE nm_bag like ? OR kd_bag like ? ORDER BY kd_bag", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}
///Data Grup
exports.data_grup = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select * from hrd_grup WHERE nm_grup like ? OR kd_grup like ? ORDER BY kd_grup", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

// ==================================================================
///paginate Sparepart Bagian
exports.sp_bagian_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from sp_bagian where no_bukti like ? or kode like ? ORDER BY no_bukti LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Sparepart Bagian
exports.count_sp_bagian_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from sp_bagian where no_bukti like ? or kode like ? ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Sparepart Bagian
exports.tambah_sp_bagian = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kode = req.body.kode;
    var bagian = req.body.bagian;
    var nama = req.body.nama;
    var total_qty = req.body.total_qty;

    connection.query("insert into sp_bagian (no_bukti,kode,bagian,nama,total_qty) values (?,?,?,?,?)", [no_bukti, kode, bagian, nama, total_qty],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Sparepart Bagian
exports.ubah_sp_bagian = function (req, res) {
    var no_id = req.body.no_id;
    var no_bukti = req.body.no_bukti;
    var kode = req.body.kode;
    var bagian = req.body.bagian;
    var nama = req.body.nama;
    var total_qty = req.body.total_qty;

    connection.query("UPDATE sp_bagian SET no_bukti=?,kode=?,bagian=?,nama=?,total_qty=? where no_id = ? ", [no_bukti, kode, bagian, nama, total_qty, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Sparepart Bagian
exports.hapus_sp_bagian = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM sp_bagian WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};


// ==================================================================
///paginate Sparepart Barang
exports.sp_barang_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from sp_bhn where KD_BHN like ? or NA_BHN like ? ORDER BY KD_BHN LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Sparepart Barang
exports.count_sp_barang_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from sp_bhn where KD_BHN like ? or NA_BHN like ? ORDER BY KD_BHN", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Sparepart Bahan
exports.tambah_sp_barang = function (req, res) {
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var RAK = req.body.RAK;
    var AKTIF = req.body.AKTIF;
    var SATUAN = req.body.SATUAN;
    var FLAG = 'BH';
    var DR = '1';

    connection.query("insert into sp_bhn (KD_BHN, NA_BHN, RAK, AKTIF, SATUAN, FLAG, DR) values (?,?,?,?,?,?,?)", [KD_BHN, NA_BHN, RAK, AKTIF, SATUAN, FLAG, DR],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Sparepart Bahan
exports.ubah_sp_barang = function (req, res) {
    var NO_ID = req.body.NO_ID;
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var RAK = req.body.RAK;
    var AKTIF = req.body.AKTIF;
    var SATUAN = req.body.SATUAN;

    connection.query("UPDATE sp_bhn SET KD_BHN=?,NA_BHN=?,RAK=?,AKTIF=?,SATUAN=? where NO_ID = ? ", [KD_BHN, NA_BHN, RAK, AKTIF, SATUAN, NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Sparepart Bahan
exports.hapus_sp_barang = function (req, res) {
    var NO_ID = req.body.NO_ID;
    connection.query("DELETE FROM sp_bhn WHERE NO_ID=? ", [NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};


// ============================================================================
///paginate Sparepart Inventori
exports.sp_inventori_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from sp_inven where no_bukti like ? or nama like ? ORDER BY no_bukti LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Sparepart Inventori
exports.count_sp_inventori_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from sp_inven where no_bukti like ? or nama like ? ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Sparepart Inventori
exports.tambah_sp_inventori = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kode = req.body.kode;
    var nama = req.body.nama;
    var bagian = req.body.bagian;
    var j_barang = req.body.j_barang;
    var merk = req.body.merk;
    var tgl_ma = req.body.tgl_ma;
    var tgl_ke = req.body.tgl_ke;
    var tgl_mutasi = req.body.tgl_mutasi;
    var jumlah = req.body.jumlah;
    var satuan = req.body.satuan;
    var keter = req.body.keter;
    var tempat = req.body.tempat;
    var rec = req.body.rec;
    var kd_brg = req.body.kd_brg;
    var dr = '1';

    connection.query("insert into sp_inven (no_bukti, kode, nama, bagian, j_barang, merk, tgl_ma, tgl_ke, tgl_mutasi, jumlah, satuan, keter, tempat, rec, kd_brg, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, kode, nama, bagian, j_barang, merk, tgl_ma, tgl_ke, tgl_mutasi, jumlah, satuan, keter, tempat, rec, kd_brg, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Sparepart Inventori
exports.ubah_sp_inventori = function (req, res) {
    var no_id = req.body.no_id;
    var no_bukti = req.body.no_bukti;
    var kode = req.body.kode;
    var nama = req.body.nama;
    var bagian = req.body.bagian;
    var j_barang = req.body.j_barang;
    var merk = req.body.merk;
    var tgl_ma = req.body.tgl_ma;
    var tgl_ke = req.body.tgl_ke;
    var tgl_mutasi = req.body.tgl_mutasi;
    var jumlah = req.body.jumlah;
    var satuan = req.body.satuan;
    var keter = req.body.keter;
    var tempat = req.body.tempat;
    var rec = req.body.rec;
    var kd_brg = req.body.kd_brg;

    connection.query("UPDATE sp_inven SET no_bukti=?,kode=?,nama=?,bagian=?,j_barang=?, merk=?, tgl_ma=?, tgl_ke=?, tgl_mutasi=?, jumlah=?, satuan=?, keter=?, tempat=?, rec=?, kd_brg=? where no_id=? ", [no_bukti, kode, nama, bagian, j_barang, merk, tgl_ma, tgl_ke, tgl_mutasi, jumlah, satuan, keter, tempat, rec, kd_brg, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Sparepart Inventori
exports.hapus_sp_inventori = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM sp_inven WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};

// ===========================================================================
///paginate HRD Pegawai
exports.hrd_pegawai_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_peg where nm_peg like ? ORDER BY nm_peg LIMIT ?, ?", [filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate HRD Pegawai
exports.count_hrd_pegawai_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_peg where nm_peg like ? ORDER BY nm_peg", [filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data HRD Pegawai
exports.tambah_hrd_pegawai = function (req, res) {
    var nik = req.body.nik;
    var nm_peg = req.body.nm_peg;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var aktif = req.body.aktif;
    var jk = req.body.jk;
    var kpj = req.body.kpj;
    var bpjs = req.body.bpjs;
    var alamat = req.body.alamat;
    var kota = req.body.kota;
    var kab = req.body.kab;
    var pendidikan = req.body.pendidikan;
    var tgl_masuk = req.body.tgl_masuk;
    var dr = req.body.dr;
    var rec = req.body.rec;
    var pokok = req.body.pokok;
    var umakan = req.body.umakan;
    var tjabatan = req.body.tjabatan;
    var tperbulan = req.body.tperbulan;
    var tastek = req.body.tastek;
    var premi = req.body.premi;
    var lbl = req.body.lbl;
    var ulembur = req.body.ulembur;
    var gaji = req.body.gaji;
    var nett = req.body.nett;

    connection.query("insert into hrd_peg (nik, nm_peg, kd_bag, nm_bag, aktif, jk, kpj, bpjs, alamat, kota, kab, pendidikan, tgl_masuk, dr, rec, pokok, umakan, tjabatan, tperbulan, tastek, premi, lbl, ulembur, gaji, nett) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [nik, nm_peg, kd_bag, nm_bag, aktif, jk, kpj, bpjs, alamat, kota, kab, pendidikan, tgl_masuk, dr, rec, pokok, umakan, tjabatan, tperbulan, tastek, premi, lbl, ulembur, gaji, nett],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data HRD Pegawai
exports.ubah_hrd_pegawai = function (req, res) {
    var no_id = req.body.no_id;
    var nik = req.body.nik;
    var nm_peg = req.body.nm_peg;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var aktif = req.body.aktif;
    var jk = req.body.jk;
    var kpj = req.body.kpj;
    var bpjs = req.body.bpjs;
    var alamat = req.body.alamat;
    var kota = req.body.kota;
    var kab = req.body.kab;
    var pendidikan = req.body.pendidikan;
    var tgl_masuk = req.body.tgl_masuk;
    var dr = req.body.dr;
    var rec = req.body.rec;
    var pokok = req.body.pokok;
    var umakan = req.body.umakan;
    var tjabatan = req.body.tjabatan;
    var tperbulan = req.body.tperbulan;
    var tastek = req.body.tastek;
    var premi = req.body.premi;
    var lbl = req.body.lbl;
    var ulembur = req.body.ulembur;
    var gaji = req.body.gaji;
    var nett = req.body.nett;

    console.log(pokok);
    console.log(umakan);
    console.log(tjabatan);

    connection.query("UPDATE hrd_peg SET nik=?,nm_peg=?,kd_bag=?,nm_bag=?,aktif=?, jk=?, kpj=?, bpjs=?, alamat=?, kota=?, kab=?, pendidikan=?, tgl_masuk=?, dr=?, rec=?, pokok=?, umakan=?, tjabatan=?, tperbulan=?, tastek=?, premi=?, lbl=?, ulembur=?, gaji=?, nett=? where no_id=? ", [nik, nm_peg, kd_bag, nm_bag, aktif, jk, kpj, bpjs, alamat, kota, kab, pendidikan, tgl_masuk, dr, rec, pokok, umakan, tjabatan, tperbulan, tastek, premi, lbl, ulembur, gaji, nett, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data HRD Pegawai
exports.hapus_hrd_pegawai = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM hrd_peg WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};

// ==========================================================================
///paginate HRD Bagian
exports.hrd_bagian_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_bag where kd_bag like ? or nm_bag like ? ORDER BY kd_bag LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate HRD Bagian
exports.count_hrd_bagian_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_bag where kd_bag like ? or nm_bag like ? ORDER BY kd_bag", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data HRD Bagian
exports.tambah_hrd_bagian = function (req, res) {
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var prefix = req.body.prefix;
    var kd_kasi = req.body.kd_kasi;
    var nm_kasi = req.body.nm_kasi;
    var kd_grup = req.body.kd_grup;
    var nm_grup = req.body.nm_grup;
    var acno = req.body.acno;
    var dr = req.body.dr;

    connection.query("insert into hrd_bag (kd_bag,nm_bag,prefix,kd_kasi,nm_kasi,kd_grup,nm_grup,acno,dr) values (?,?,?,?,?,?,?,?,?)", [kd_bag, nm_bag, prefix, kd_kasi, nm_kasi, kd_grup, nm_grup, acno, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data HRD Bagian
exports.ubah_hrd_bagian = function (req, res) {
    var no_id = req.body.no_id;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var prefix = req.body.prefix;
    var kd_kasi = req.body.kd_kasi;
    var nm_kasi = req.body.nm_kasi;
    var kd_grup = req.body.kd_grup;
    var nm_grup = req.body.nm_grup;
    var acno = req.body.acno;
    var dr = req.body.dr;

    connection.query("UPDATE hrd_bag SET kd_bag=?,nm_bag=?,prefix=?,kd_kasi=?,nm_kasi=?,kd_grup=?,nm_grup=?,acno=?,dr=? where no_id = ? ", [kd_bag, nm_bag, prefix, kd_kasi, nm_kasi, kd_grup, nm_grup, acno, dr, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data HRD Bagian
exports.hapus_hrd_bagian = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM hrd_bag WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};


// ========================================================================
///paginate HRD Borongan
exports.hrd_borongan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_bor where kd_bag like ? or nm_bag like ? ORDER BY kd_bag LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate HRD Borongan
exports.count_hrd_borongan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_bor where kd_bag like ? or nm_bag like ? ORDER BY kd_bag", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data HRD Borongan
exports.tambah_hrd_borongan = function (req, res) {
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var stat = req.body.stat;
    var pk = req.body.pk;
    var pkph = req.body.pkph;

    connection.query("insert into hrd_bor (kd_bag,nm_bag,stat,pk,pkph) values (?,?,?,?,?)", [kd_bag, nm_bag, stat, pk, pkph],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data HRD Borongan
exports.ubah_hrd_borongan = function (req, res) {
    var no_id = req.body.no_id;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var stat = req.body.stat;
    var pk = req.body.pk;
    var pkph = req.body.pkph;

    connection.query("UPDATE hrd_bor SET kd_bag=?,nm_bag=?,stat=?,pk=?,pkph=? where no_id = ? ", [kd_bag, nm_bag, stat, pk, pkph, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data HRD Borongan
exports.hapus_hrd_borongan = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM hrd_bor WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};


// ==========================================================================
///paginate HRD Grup
exports.hrd_grup_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_grup where kd_grup like ? or nm_grup like ? ORDER BY kd_grup LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate HRD Grup
exports.count_hrd_grup_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_grup where kd_grup like ? or nm_grup like ? ORDER BY kd_grup", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data HRD Grup
exports.tambah_hrd_grup = function (req, res) {
    var kd_grup = req.body.kd_grup;
    var nm_grup = req.body.nm_grup;
    var acno = req.body.acno;

    connection.query("insert into hrd_grup (kd_grup,nm_grup,acno) values (?,?,?)", [kd_grup, nm_grup, acno],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data HRD Grup
exports.ubah_hrd_grup = function (req, res) {
    var no_id = req.body.no_id;
    var kd_grup = req.body.kd_grup;
    var nm_grup = req.body.nm_grup;
    var acno = req.body.acno;

    connection.query("UPDATE hrd_grup SET kd_grup=?,nm_grup=?,acno=? where no_id = ? ", [kd_grup, nm_grup, acno, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data HRD Grup
exports.hapus_hrd_grup = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM hrd_grup WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};


// ============================================================================
///paginate Pembelian Supplier
exports.pembelian_supplier_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from sup where KODES like ? OR NAMAS like ? ORDER BY NAMAS LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Pembelian Supplier
exports.count_pembelian_supplier_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from sup where KODES like ? OR NAMAS like ? ORDER BY NAMAS", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Pembelian Supllier
exports.tambah_pembelian_supplier = function (req, res) {
    var KODES = req.body.KODES;
    var NAMAS = req.body.NAMAS;
    var KOTA = req.body.KOTA;

    connection.query("insert into sup (KODES,NAMAS,KOTA) values (?,?,?)", [KODES, NAMAS, KOTA],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Pembelian Supplier
exports.ubah_pembelian_supplier = function (req, res) {
    var NO_ID = req.body.NO_ID;
    var KODES = req.body.KODES;
    var NAMAS = req.body.NAMAS;
    var KOTA = req.body.KOTA;

    connection.query("UPDATE sup SET KODES=?,NAMAS=?,KOTA=? where NO_ID = ? ", [KODES, NAMAS, KOTA, NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Pembelian Supllier
exports.hapus_pembelian_supplier = function (req, res) {
    var NO_ID = req.body.NO_ID;
    connection.query("DELETE FROM sup WHERE NO_ID=? ", [NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};

// ===================================================================
///paginate Pembelian Bahan
exports.pembelian_bahan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from bhn where FLAG = 'BH' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Pembelian Bahan
exports.count_pembelian_bahan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from bhn where FLAG = 'BH' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Pembelian Bahan
exports.tambah_pembelian_bahan = function (req, res) {
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("insert into bhn (KD_BHN, NA_BHN, SATUAN, AKTIF) values (?,?,?,?)", [KD_BHN, NA_BHN, SATUAN, AKTIF],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Pembelian Bahan
exports.ubah_pembelian_bahan = function (req, res) {
    var NO_ID = req.body.NO_ID;
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("UPDATE bhn SET KD_BHN=?,NA_BHN=?,SATUAN=?,AKTIF=?,SATUAN=? where NO_ID = ? ", [KD_BHN, NA_BHN, SATUAN, AKTIF, NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Pembelian Bahan
exports.hapus_pembelian_bahan = function (req, res) {
    var NO_ID = req.body.NO_ID;
    connection.query("DELETE FROM bhn WHERE NO_ID=? ", [NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};

// ===================================================================
///paginate Pembelian Non Bahan
exports.pembelian_nonbahan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from bhn where FLAG = 'BH' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Pembelian nonbahan
exports.count_pembelian_nonbahan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from bhn where FLAG = 'BH' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Pembelian nonbahan
exports.tambah_pembelian_nonbahan = function (req, res) {
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("insert into bhn (KD_BHN, NA_BHN, SATUAN, AKTIF) values (?,?,?,?)", [KD_BHN, NA_BHN, SATUAN, AKTIF],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Pembelian nonbahan
exports.ubah_pembelian_nonbahan = function (req, res) {
    var NO_ID = req.body.NO_ID;
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("UPDATE bhn SET KD_BHN=?,NA_BHN=?,SATUAN=?,AKTIF=?,SATUAN=? where NO_ID = ? ", [KD_BHN, NA_BHN, SATUAN, AKTIF, NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Pembelian nonbahan
exports.hapus_pembelian_nonbahan = function (req, res) {
    var NO_ID = req.body.NO_ID;
    connection.query("DELETE FROM bhn WHERE NO_ID=? ", [NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};

// ===================================================================
///paginate Pembelian Sparepart
exports.pembelian_sparepart_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from bhn where FLAG = 'BH' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Pembelian sparepart
exports.count_pembelian_sparepart_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from bhn where FLAG = 'BH' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Pembelian sparepart
exports.tambah_pembelian_sparepart = function (req, res) {
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("insert into bhn (KD_BHN, NA_BHN, SATUAN, AKTIF) values (?,?,?,?)", [KD_BHN, NA_BHN, SATUAN, AKTIF],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Pembelian sparepart
exports.ubah_pembelian_sparepart = function (req, res) {
    var NO_ID = req.body.NO_ID;
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("UPDATE bhn SET KD_BHN=?,NA_BHN=?,SATUAN=?,AKTIF=?,SATUAN=? where NO_ID = ? ", [KD_BHN, NA_BHN, SATUAN, AKTIF, NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Pembelian sparepart
exports.hapus_pembelian_sparepart = function (req, res) {
    var NO_ID = req.body.NO_ID;
    connection.query("DELETE FROM bhn WHERE NO_ID=? ", [NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};

// =======================================================================
///paginate Pembelian Mesin
exports.pembelian_mesin_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from bhn where FLAG = 'MS' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Pembelian Mesin
exports.count_pembelian_mesin_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from bhn where FLAG = 'MS' OR KD_BHN like ? OR NA_BHN like ? ORDER BY KD_BHN", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data Pembelian Mesin
exports.tambah_pembelian_mesin = function (req, res) {
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("insert into bhn (KD_BHN, NA_BHN, SATUAN, AKTIF, SATUAN) values (?,?,?,?)", [KD_BHN, NA_BHN, SATUAN, AKTIF],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};


//update Data Pembelian Mesin
exports.ubah_pembelian_mesin = function (req, res) {
    var NO_ID = req.body.NO_ID;
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var AKTIF = req.body.AKTIF;

    connection.query("UPDATE bhn SET KD_BHN=?,NA_BHN=?,SATUAN=?,AKTIF=?,SATUAN=? where NO_ID = ? ", [KD_BHN, NA_BHN, SATUAN, AKTIF, NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data Pembelian Mesin
exports.hapus_pembelian_mesin = function (req, res) {
    var NO_ID = req.body.NO_ID;
    connection.query("DELETE FROM bhn WHERE NO_ID=? ", [NO_ID],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};


// =======================================================================

///LAPORAN ABSEN
exports.lap_absen_harian = function (req, res) {
    var PER = req.body.PER;
    var KD_BAG = req.body.KD_BAG;
    connection.query("SELECT hrd_peg.kd_peg AS KD_PEG, hrd_peg.nm_peg AS NM_PEG, CONCAT(hrd_peg.kd_bag,' - ',hrd_peg.nm_bag) AS BAGIAN, CASE hrd_peg.aktif WHEN '1' THEN 'AKTIF' WHEN '0' THEN 'TIDAK AKTIF' END AS AKTIF, ? AS PER FROM hrd_peg, hrd_bag WHERE hrd_peg.kd_bag=hrd_bag.kd_bag  AND hrd_peg.kd_bag=? AND hrd_peg.aktif='1' ORDER BY hrd_peg.kd_peg", [PER, KD_BAG],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
};
///LAPORAN ABSEN LEMBUR
exports.lap_absen_lemburan = function (req, res) {
    var filter_kd_bag = '';
    var KD_BAG = req.body.KD_BAG;
    if (req.body.KD_BAG != '') {
        filter_kd_bag = "AND hrd_peg.kd_bag='" + KD_BAG + "'";
    }
    connection.query("SELECT hrd_peg.kd_peg AS KD_PEG, hrd_peg.nm_peg AS NM_PEG, CONCAT(hrd_peg.kd_bag,' - ',hrd_peg.nm_bag) AS BAGIAN, hrd_peg.ulembur AS ULEMBUR FROM hrd_peg, hrd_bag WHERE hrd_peg.kd_bag=hrd_bag.kd_bag AND hrd_peg.aktif='1' " + filter_kd_bag + " ORDER BY hrd_peg.kd_peg",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
};

///LAPORAN LEMBUR HARIAN
exports.lap_lembur_harian = function (req, res) {
    var filter_kd_bag = '';
    var filter_tgl = '';
    var KD_BAG = req.body.KD_BAG;
    var TGL = req.body.TGL;
    if (req.body.KD_BAG != '') {
        filter_kd_bag = "AND hrd_lemd.kd_bag='" + KD_BAG + "'";
    }
    if (req.body.TGL != '') {
        filter_tgl = "AND hrd_lemd.tgl='" + TGL + "'";
    }

    connection.query("SELECT hrd_lemd.nm_peg AS NM_PEG, hrd_lemd.no_bukti AS NO_BUKTI, CONCAT(hrd_lemd.kd_peg,' - ',hrd_lemd.nm_peg) AS PEGAWAI, CONCAT(hrd_lemd.kd_bag,' - ',hrd_lemd.nm_bag) AS BAGIAN, hrd_lemd.ulembur AS ULEMBUR, hrd_lemd.tgl AS TGL FROM hrd_lemd WHERE hrd_lemd.flag='HR' " + filter_kd_bag + " " + filter_tgl + " ORDER BY hrd_lemd.kd_peg",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                // console.log(fields);
                response.ok(rows, res);

            }
        });
};

///LAPORAN LEMBUR BORONGAN
exports.lap_lembur_borongan = function (req, res) {
    var filter_kd_bag = '';
    var filter_tgl = '';
    var KD_BAG = req.body.KD_BAG;
    var TGL = req.body.TGL;
    if (req.body.KD_BAG != '') {
        filter_kd_bag = "AND hrd_lemd.kd_bag='" + KD_BAG + "'";
    }
    if (req.body.TGL != '') {
        filter_tgl = "AND hrd_lemd.tgl='" + TGL + "'";
    }
    connection.query("SELECT hrd_lemd.nm_peg AS NM_PEG, hrd_lemd.no_bukti AS NO_BUKTI, CONCAT(hrd_lemd.kd_peg,' - ',hrd_lemd.nm_peg) AS PEGAWAI, CONCAT(hrd_lemd.kd_bag,' - ',hrd_lemd.nm_bag) AS BAGIAN, hrd_lemd.tgl AS TGL, hrd_lemd.ulembur AS ULEMBUR FROM hrd_lemd, hrd_bag WHERE hrd_lemd.kd_bag=hrd_bag.kd_bag  " + filter_kd_bag + " " + filter_tgl + " AND hrd_lemd.flag='BR' ORDER BY hrd_lemd.kd_peg",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
};

///LAPORAN LEMBUR PER JAM
exports.lap_lembur_perjam = function (req, res) {
    var filter_kd_bag = '';
    var filter_tgl = '';
    var KD_BAG = req.body.KD_BAG;
    var TGL = req.body.TGL;
    if (req.body.KD_BAG != '') {
        filter_kd_bag = "AND hrd_lemd.kd_bag='" + KD_BAG + "'";
    }
    if (req.body.TGL != '') {
        filter_tgl = "AND hrd_lemd.tgl='" + TGL + "'";
    }
    connection.query("SELECT hrd_lemd.nm_peg AS NM_PEG, hrd_lemd.no_bukti AS NO_BUKTI, CONCAT(hrd_lemd.kd_peg,' - ',hrd_lemd.nm_peg) AS PEGAWAI, CONCAT(hrd_lemd.kd_bag,' - ',hrd_lemd.nm_bag) AS BAGIAN, hrd_lemd.tgl AS TGL, hrd_lemd.ulembur AS ULEMBUR FROM hrd_lemd, hrd_bag WHERE hrd_lemd.kd_bag=hrd_bag.kd_bag " + filter_kd_bag + " " + filter_tgl + " AND hrd_lemd.flag='PJ' ORDER BY hrd_lemd.kd_peg",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
};

///LAPORAN LEMBUR HARIAN
exports.lap_gaji_harian = function (req, res) {
    var filter_kd_bag = '';
    var filter_tgl = '';
    var KD_BAG = req.body.KD_BAG;
    var TGL = req.body.TGL;
    if (req.body.KD_BAG != '') {
        filter_kd_bag = "AND hrd_lemd.kd_bag='" + KD_BAG + "'";
    }
    if (req.body.TGL != '') {
        filter_tgl = "AND hrd_lemd.tgl='" + TGL + "'";
    }

    connection.query("SELECT hrd_lemd.nm_peg AS NM_PEG, hrd_lemd.no_bukti AS NO_BUKTI, CONCAT(hrd_lemd.kd_peg,' - ',hrd_lemd.nm_peg) AS PEGAWAI, CONCAT(hrd_lemd.kd_bag,' - ',hrd_lemd.nm_bag) AS BAGIAN, hrd_lemd.ulembur AS ULEMBUR, hrd_lemd.tgl AS TGL FROM hrd_lemd WHERE hrd_lemd.flag='HR' " + filter_kd_bag + " " + filter_tgl + " ORDER BY hrd_lemd.kd_peg",
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                // console.log(fields);
                response.ok(rows, res);

            }
        });
};

///TRANSAKSI HEADER DETAIL
///HEADER
// ==================================================================
///Paginate Transaksi Harian
exports.harian_paginate = function (req, res) {
    var filter_cari = "%" + req.body.cari + "%";
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_absen where (no_bukti like ? OR kd_bag like ?) AND flag='HR' ORDER BY no_bukti LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi Harian
exports.count_harian_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_absen where (no_bukti like ? OR kd_bag like ?) AND flag='HR' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_harian = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kd_grup = req.body.kd_grup;
    var nm_grup = req.body.nm_grup;
    var notes = req.body.notes;
    var dr = req.body.dr;
    var flag = req.body.flag;
    var per = req.body.per;
    connection.query("insert into hrd_absen (no_bukti, kd_bag, nm_bag, kd_grup, nm_grup, notes, flag, dr, per) values (?,?,?,?,?,?,?,?,?)", [no_bukti, kd_bag, nm_bag, kd_grup, nm_grup, notes, flag, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Harian Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_harian = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kd_peg = req.body.kd_peg;
    var nm_peg = req.body.nm_peg;
    var kd_grup = req.body.kd_grup;
    var nm_grup = req.body.nm_grup;
    var dr = req.body.dr;
    var ptkp = req.body.ptkp;
    var hr = req.body.hr;
    var jam1 = req.body.jam1;
    var jam2 = req.body.jam2;
    var jam1rp = req.body.jam1rp;
    var jam2rp = req.body.jam2rp;
    var lain = req.body.lain;
    var insentifbulanan = req.body.insentifbulanan;
    var jumlah = req.body.jumlah;
    connection.query("insert into hrd_absend (no_bukti,flag,kd_bag,nm_bag,kd_peg,nm_peg,kd_grup,nm_grup,dr,ptkp,hr,jam1,jam2,jam1rp,jam2rp,lain,tperbulan,jumlah) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, flag, kd_bag, nm_bag, kd_peg, nm_peg, kd_grup, nm_grup, dr, ptkp, hr, jam1, jam2, jam1rp, jam2rp, lain, insentifbulanan, jumlah],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_harian = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var notes = req.body.notes;
    connection.query("UPDATE hrd_absen set kd_bag=?,nm_bag=?,notes=? WHERE no_bukti=?", [kd_bag, nm_bag, notes, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_harian = function (req, res) {
    var tabel = req.body.tabel;
    var NO_BUKTI = req.body.no_bukti;
    connection.query("delete from ?? where NO_BUKTI = ?", [tabel, NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

///TRANSAKSI HEADER DETAIL BORONGAN
///HEADER
// ==================================================================
///Paginate Transaksi Borongan
exports.borongan_paginate = function (req, res) {
    var filter_cari = "%" + req.body.cari + "%";
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_absen where (no_bukti like ? OR kd_bag like ?) AND flag='BR' ORDER BY no_bukti LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi Borongan
exports.count_borongan_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_absen where (no_bukti like ? OR kd_bag like ?) AND flag='BR' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_borongan = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kd_grup = req.body.kd_grup;
    var flag = req.body.flag;
    var dr = req.body.dr;
    var per = req.body.per;
    var total_kik = req.body.total_kik;
    var lain = req.body.lain;
    var tot_bon = req.body.tot_bon;
    var other = req.body.other;
    var kik_net = req.body.kik_net;
    var tms = req.body.tms;
    var premi = req.body.premi;
    var notes = req.body.notes;
    connection.query("insert into hrd_absen (no_bukti, kd_bag, nm_bag, kd_grup,  flag, dr, per, tot_kik, tlain, tbon, other, kik_nett, tms, premi, notes) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, kd_bag, nm_bag, kd_grup, flag, dr, per, total_kik, lain, tot_bon, other, kik_net, tms, premi, notes],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah borongan Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_borongan = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var dr = req.body.dr;
    var per = req.body.per;
    var nm_bag = req.body.nm_bag;
    var kd_bag = req.body.kd_bag;
    var kd_peg = req.body.kd_peg;
    var nm_peg = req.body.nm_peg;
    var ptkp = req.body.ptkp;
    var st = req.body.st;
    var ms = req.body.ms;
    var hr = req.body.hr;
    var ik = req.body.ik;
    var nb = req.body.nb;
    var upah = req.body.upah;
    var bon = req.body.bon;
    var subsidi = req.body.subsidi;
    var sub = req.body.sub;
    var jumlah = req.body.jumlah;
    connection.query("insert into hrd_absend (no_bukti,flag,dr,per,nm_bag,kd_bag,kd_peg,nm_peg,ptkp,stat,ms,hr,ik,nb,nett,bon,subsidi,sub,jumlah) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, flag, dr, per, nm_bag, kd_bag, kd_peg, nm_peg, ptkp, st, ms, hr, ik, nb, upah, bon, subsidi, sub, jumlah],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_borongan = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kd_grup = req.body.kd_grup;
    var total_kik = req.body.total_kik;
    var lain = req.body.lain;
    var tot_bon = req.body.tot_bon;
    var other = req.body.other;
    var kik_net = req.body.kik_net;
    var tms = req.body.tms;
    var premi = req.body.premi;
    var notes = req.body.notes;
    connection.query("UPDATE hrd_absen set kd_bag=?,nm_bag=?,kd_grup=?,tot_kik=?,tlain=?,tbon=?,other=?,kik_nett=?,tms=?,premi=?,notes=? WHERE no_bukti=?", [kd_bag, nm_bag, kd_grup, total_kik, lain, tot_bon, other, kik_net, tms, premi, notes, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_borongan = function (req, res) {
    var tabel = req.body.tabel;
    var NO_BUKTI = req.body.no_bukti;
    connection.query("delete from ?? where NO_BUKTI = ?", [tabel, NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

///TRANSAKSI HEADER DETAIL KIK JAHIT
///HEADER
// ==================================================================
///Paginate Transaksi kik_jahit
exports.kik_jahit_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'JAHIT' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_jahit
exports.count_kik_jahit_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'JAHIT' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_jahit = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_jahit Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_jahit = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_jahit = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_jahit = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_jahit = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};


///TRANSAKSI HEADER DETAIL KIK JUKI
///HEADER
// ==================================================================
///Paginate Transaksi kik_juki
exports.kik_juki_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'JUKI' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_juki
exports.count_kik_juki_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'JUKI' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_juki = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_juki Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_juki = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_juki = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_juki = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_juki = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK KSP
///HEADER
// ==================================================================
///Paginate Transaksi kik_ksp
exports.kik_ksp_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'KSP' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_ksp
exports.count_kik_ksp_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'KSP' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_ksp = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_ksp Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_ksp = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_ksp = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_ksp = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_ksp = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK PACKING
///HEADER
// ==================================================================
///Paginate Transaksi kik_packing
exports.kik_packing_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'PACKING' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_packing
exports.count_kik_packing_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'PACKING' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_packing = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_packing Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_packing = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_packing = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_packing = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_packing = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK PLONG
///HEADER
// ==================================================================
///Paginate Transaksi kik_plong
exports.kik_plong_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'PLONG' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_plong
exports.count_kik_plong_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'PLONG' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_plong = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_plong Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_plong = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_plong = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_plong = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_plong = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK SABLON
///HEADER
// ==================================================================
///Paginate Transaksi kik_sablon
exports.kik_sablon_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'SABLON' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_sablon
exports.count_kik_sablon_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'SABLON' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_sablon = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_sablon Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_sablon = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_sablon = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_sablon = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_sablon = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK INJECTION
///HEADER
// ==================================================================
///Paginate Transaksi kik_injection
exports.kik_injection_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'INJECTION' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_injection
exports.count_kik_injection_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'INJECTION' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_injection = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_injection Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_injection = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_injection = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_injection = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_injection = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK ASSEMBLING
///HEADER
// ==================================================================
///Paginate Transaksi kik_assembling
exports.kik_assembling_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'ASSEMBLING' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_assembling
exports.count_kik_assembling_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'ASSEMBLING' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_assembling = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_assembling Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_assembling = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_assembling = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_assembling = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_assembling = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK CAT SPRAY
///HEADER
// ==================================================================
///Paginate Transaksi kik_catspray
exports.kik_catspray_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'CAT SPRAY' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_catspray
exports.count_kik_catspray_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'CAT SPRAY' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_catspray = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_catspray Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_catspray = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_catspray = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_catspray = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_catspray = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK COMPOUND
///HEADER
// ==================================================================
///Paginate Transaksi kik_compound
exports.kik_compound_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'COMPOUND' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_compound
exports.count_kik_compound_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'COMPOUND' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_compound = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_compound Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_compound = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_compound = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_compound = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_compound = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK FLOCKING
///HEADER
// ==================================================================
///Paginate Transaksi kik_flocking
exports.kik_flocking_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'FLOCKING' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_flocking
exports.count_kik_flocking_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'FLOCKING' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_flocking = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_flocking Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_flocking = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_flocking = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_flocking = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_flocking = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK STRONG
///HEADER
// ==================================================================
///Paginate Transaksi kik_strong
exports.kik_strong_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'STRONG' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_strong
exports.count_kik_strong_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'STRONG' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_strong = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_strong Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_strong = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_strong = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_strong = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_strong = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK MICRO
///HEADER
// ==================================================================
///Paginate Transaksi kik_micro
exports.kik_micro_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'MICRO' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_micro
exports.count_kik_micro_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'MICRO' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_micro = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_micro Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_micro = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_micro = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_micro = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_micro = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KIK DR2
///HEADER
// ==================================================================
///Paginate Transaksi kik_dr2
exports.kik_dr2_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'DR2' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi kik_dr2
exports.count_kik_dr2_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'DR2' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_kik_dr2 = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah kik_dr2 Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kik_dr2 = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_kik_dr2 = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_kik_dr2 = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_kik_dr2 = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL PREMI PSP
///HEADER
// ==================================================================
///Paginate Transaksi premi_psp
exports.premi_psp_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'MICRO' LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate Transaksi premi_psp
exports.count_premi_psp_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_kik where (no_bukti like ? or kd_bag like ?) AND flag = 'MICRO' ORDER BY no_bukti", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

exports.tambah_header_premi_psp = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var flag = req.body.flag;
    var per = req.body.per;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var tqty = req.body.tqty;
    var tjumlah = req.body.tjumlah;
    var t_hr = req.body.t_hr;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    var dr = req.body.dr;
    connection.query("insert into hrd_kik (no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, fase, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, per, kd_bag, nm_bag, kik_grup, tqty, tjumlah, t_hr, notes, flag, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah premi_psp Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_premi_psp = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var no_kik = req.body.no_kik;
    var tgl_kik = req.body.tgl_kik;
    var model = req.body.model;
    var item = req.body.item;
    var des1 = req.body.des1;
    var qty = req.body.qty;
    var upah = req.body.upah;
    var jumlah = req.body.jumlah;
    var org = req.body.org;
    var hr = req.body.hr;
    var dr = req.body.dr;
    var per = req.body.per;
    connection.query("insert into hrd_kikd (no_bukti,no_kik,tgl_kik,model,item,des1,qty,upah,jumlah,org,hr,dr,fase) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", [no_bukti, no_kik, tgl_kik, model, item, des1, qty, upah, jumlah, org, hr, dr, per],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

exports.edit_header_premi_psp = function (req, res) {
    var no_bukti = req.body.no_bukti;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var kik_grup = req.body.kik_grup;
    var notes = req.body.notes;
    var periode = req.body.periode;
    var ppn = req.body.ppn;
    var minuss = req.body.minuss;
    var lunas_bs = req.body.lunas_bs;
    var upah_tambah = req.body.upah_tambah;
    var pot_bon = req.body.pot_bon;
    connection.query("UPDATE hrd_kik set kd_bag=?,nm_bag=?,kik_grup=?,notes=?,fase=?,ppn=?,minuss=?,lunas_bs=?,upah_tambah=?,pot_bon=? WHERE no_bukti=?", [kd_bag, nm_bag, kik_grup, notes, periode, ppn, minuss, lunas_bs, upah_tambah, pot_bon, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Edit Kas Header', res);
            }
        });
};

exports.hapus_premi_psp = function (req, res) {
    var tabel = req.body.tabel;
    var no_bukti = req.body.no_bukti;
    connection.query("delete from ?? where no_bukti = ?", [tabel, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

exports.urut_nobukti_premi_psp = function (req, res) {
    var per = req.body.per;
    connection.query("SELECT no_bukti FROM hrd_kik where per = ?", [per], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

///TRANSAKSI HEADER DETAIL KAS
///HEADER
exports.tampil_kas_masuk = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    var tgl_awal = req.body.tglawal;
    var tgl_akhir = req.body.tglakhir;
    connection.query("select * from kas where if(?<>'',NO_BUKTI like ?,true) AND TGL BETWEEN ? AND ? AND TYPE='BKM'", [cari, cari, tgl_awal, tgl_akhir], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

exports.tampil_kas_keluar = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    var tgl_awal = req.body.tglawal;
    var tgl_akhir = req.body.tglakhir;
    connection.query("select * from kas where if(?<>'',NO_BUKTI LIKE ?,true) AND TGL BETWEEN ? AND ? AND TYPE='BKK'", [cari, cari, tgl_awal, tgl_akhir], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};


exports.tambah_header_kas = function (req, res) {
    var NO_BUKTI = req.body.nobukti;
    var TANGGAL = req.body.tgl;
    var PER = req.body.per;
    var TIPE = req.body.tipe;
    var KET = req.body.ket;
    var USER = req.body.user;
    var BACNO = req.body.bacno;
    var BNAMA = req.body.bnama;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("insert into kas (NO_BUKTI,TGL,PER,TYPE,KET,USRNM,BACNO,BNAMA,JUMLAH) values (?,?,?,?,?,?,?,?,?)", [NO_BUKTI, TANGGAL, PER, TIPE, KET, USER, BACNO, BNAMA, JUMLAH],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_kas = function (req, res) {
    var REC = req.body.rec;
    var NO_BUKTI = req.body.nobukti;
    var PER = req.body.per;
    var TIPE = req.body.tipe;
    var ACNO = req.body.acno;
    var NACNO = req.body.nacno;
    var URAIAN = req.body.uraian;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("insert into kasd (REC,NO_BUKTI,PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH) values (?,?,?,?,?,?,?,?)", [REC, NO_BUKTI, PER, TIPE, ACNO, NACNO, URAIAN, JUMLAH],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Kas Detail', res);

            }
        });
};

exports.hapus_header_kas = function (req, res) {
    var NO_BUKTI = req.body.no_bukti;
    connection.query("DELETE FROM kas WHERE NO_BUKTI = ?", [NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Kas Header', res);

            }
        });
};

exports.hapus_detail_kas = function (req, res) {
    var NO_BUKTI = req.body.no_bukti;
    connection.query("DELETE FROM kasd WHERE NO_BUKTI = ?", [NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Kas Detail', res);

            }
        });
};

exports.edit_header_kas = function (req, res) {
    var NO_BUKTI = req.body.nobukti;
    var TANGGAL = req.body.tgl;
    var KET = req.body.ket;
    var USER = req.body.user;
    var BACNO = req.body.bacno;
    var BNAMA = req.body.bnama;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("UPDATE kas set TGL=?,KET=?,USRNM=?,BACNO=?,BNAMA=?,JUMLAH=? WHERE NO_BUKTI=?", [TANGGAL, KET, USER, BACNO, BNAMA, JUMLAH, NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Edit Kas Header', res);

            }
        });
};

///TRANSAKSI HEADER DETAIL BANK
///HEADER
exports.tampil_bank_masuk = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    var tgl_awal = req.body.tglawal;
    var tgl_akhir = req.body.tglakhir;
    connection.query("select * from bank where if(?<>'',NO_BUKTI LIKE ?,true) AND TGL BETWEEN ? AND ? AND TYPE='BBM'", [cari, cari, tgl_awal, tgl_akhir], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

exports.tampil_bank_keluar = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    var tgl_awal = req.body.tglawal;
    var tgl_akhir = req.body.tglakhir;
    connection.query("select * from bank where if(?<>'',NO_BUKTI LIKE ?,true) AND TGL BETWEEN ? AND ? AND TYPE='BBK'", [cari, cari, tgl_awal, tgl_akhir], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

exports.tambah_header_bank = function (req, res) {
    var NO_BUKTI = req.body.nobukti;
    var TANGGAL = req.body.tgl;
    var PER = req.body.per;
    var TIPE = req.body.tipe;
    var KET = req.body.ket;
    var USER = req.body.user;
    var BACNO = req.body.bacno;
    var BNAMA = req.body.bnama;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("insert into bank (NO_BUKTI,TGL,PER,TYPE,KET,USRNM,BACNO,BNAMA,JUMLAH) values (?,?,?,?,?,?,?,?,?)", [NO_BUKTI, TANGGAL, PER, TIPE, KET, USER, BACNO, BNAMA, JUMLAH],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Bank Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_bank = function (req, res) {
    var REC = req.body.rec;
    var NO_BUKTI = req.body.nobukti;
    var PER = req.body.per;
    var TIPE = req.body.tipe;
    var ACNO = req.body.acno;
    var NACNO = req.body.nacno;
    var URAIAN = req.body.uraian;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("insert into bankd (REC,NO_BUKTI,PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH) values (?,?,?,?,?,?,?,?)", [REC, NO_BUKTI, PER, TIPE, ACNO, NACNO, URAIAN, JUMLAH],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Bank Detail', res);

            }
        });
};

exports.edit_header_bank = function (req, res) {
    var NO_BUKTI = req.body.nobukti;
    var TANGGAL = req.body.tgl;
    var KET = req.body.ket;
    var USER = req.body.user;
    var BACNO = req.body.bacno;
    var BNAMA = req.body.bnama;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("UPDATE bank set TGL=?,KET=?,USRNM=?,BACNO=?,BNAMA=?,JUMLAH=? WHERE NO_BUKTI=?", [TANGGAL, KET, USER, BACNO, BNAMA, JUMLAH, NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Edit Bank Header', res);

            }
        });
};


///TRANSAKSI HEADER DETAIL MEMO
///HEADER
exports.tampil_memo = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    var tgl_awal = req.body.tglawal;
    var tgl_akhir = req.body.tglakhir;
    connection.query("select * from memo where if(?<>'',NO_BUKTI LIKE ?,true) AND TGL BETWEEN ? AND ?", [cari, cari, tgl_awal, tgl_akhir], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

exports.tambah_header_memo = function (req, res) {
    var NO_BUKTI = req.body.nobukti;
    var TANGGAL = req.body.tgl;
    var PER = req.body.per;
    var TIPE = req.body.tipe;
    var KET = req.body.ket;
    var USER = req.body.user;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("insert into memo (NO_BUKTI,TGL,PER,TYPE,KET,USRNM,JUMLAH) values (?,?,?,?,?,?,?)", [NO_BUKTI, TANGGAL, PER, TIPE, KET, USER, JUMLAH],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah memo Header', res);

            }
        });
};

///DETAIL
exports.tambah_detail_memo = function (req, res) {
    var REC = req.body.rec;
    var NO_BUKTI = req.body.nobukti;
    var PER = req.body.per;
    var ACNO = req.body.acno;
    var NACNO = req.body.nacno;
    var URAIAN = req.body.uraian;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("insert into memod (REC,NO_BUKTI,PER,ACNO,NACNO,URAIAN,JUMLAH) values (?,?,?,?,?,?,?)", [REC, NO_BUKTI, PER, ACNO, NACNO, URAIAN, JUMLAH],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah memo Detail', res);

            }
        });
};

exports.edit_header_memo = function (req, res) {
    var NO_BUKTI = req.body.nobukti;
    var TANGGAL = req.body.tgl;
    var KET = req.body.ket;
    var USER = req.body.user;
    var JUMLAH = Number(req.body.jumlah);
    connection.query("UPDATE memo set TGL=?,KET=?,USRNM=?,JUMLAH=? WHERE NO_BUKTI=?", [TANGGAL, KET, USER, JUMLAH, NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Edit memo Header', res);

            }
        });
};


// =============================================================================

// modal data account header kas
exports.modal_acc_kas = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    if ([cari] != '') {
        connection.query("select * from account where BNK='1' and (ACNO like ? or NAMA like ?) order by ACNO", [cari, cari],
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                } else {

                    response.ok(rows, res);

                }
            });
    } else {
        connection.query("select * from account order by ACNO",
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                } else {

                    response.ok(rows, res);

                }
            });
    };
};

// modal data account header bank
exports.modal_acc_bank = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    if ([cari] != '') {
        connection.query("select * from account where BNK='2' and (ACNO like ? or NAMA like ?) order by ACNO", [cari, cari],
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                } else {

                    response.ok(rows, res);

                }
            });
    } else {
        connection.query("select * from account order by ACNO",
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                } else {

                    response.ok(rows, res);

                }
            });
    };
};

///NO BUKTI OTOMATIS
exports.no_urut = function (req, res) {
    var jenis = req.body.tipe;
    var tabelx = req.body.tabel;
    var kolomx = req.body.kolom;
    // var filter_cari = '%'+req.body.cari+'%';
    connection.query("SELECT right(coalesce(MAX(??),0),4) as NOMOR from ?? where left(??,2)=?", [kolomx, tabelx, kolomx, jenis],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///CHECK NO BUKTI
exports.check_no_bukti = function (req, res) {
    var nobukti = req.body.cari;
    var tabelx = req.body.tabel;
    var kolomx = req.body.kolom;
    // var filter_cari = '%'+req.body.cari+'%';
    connection.query("SELECT * from ?? where ??=?", [tabelx, kolomx, nobukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///SELECT DETAIL TRANSAKSI
exports.select_detail = function (req, res) {
    var nobukti = req.body.cari;
    var tabelx = req.body.tabel;
    var kolomx = req.body.kolom;
    // var filter_cari = '%'+req.body.cari+'%';
    connection.query("SELECT * from ?? where ??=?", [tabelx, kolomx, nobukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///HAPUS DETAIL TRANSAKSI
exports.hapus_detail = function (req, res) {
    var nobukti = req.body.no_bukti;
    var tabelx = req.body.tabel;
    var kolomx = req.body.kolom;
    // var filter_cari = '%'+req.body.cari+'%';
    connection.query("DELETE from ?? where ??=?", [tabelx, kolomx, nobukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

