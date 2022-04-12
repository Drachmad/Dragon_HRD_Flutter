
'use strict';

var response = require('../res');
var connection = require('../koneksi');
var md5 = require('md5');

exports.index = function (req, res) {
    response.ok('aplikasi rest api berjalan', res)
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


// ===========================================================================
///paginate HRD Model
exports.hrd_model_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    connection.query("select * from hrd_model where model like ? ORDER BY model LIMIT ?, ?", [filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}

///paginate HRD model
exports.count_hrd_model_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select COUNT(*) from hrd_model where model like ? ORDER BY model", [filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

//tambah Data HRD Model
exports.tambah_header_hrd_model = function (req, res) {
    var model = req.body.model;
    var notes = req.body.notes;
    var dr = req.body.dr;

    connection.query("insert into hrd_model (model,notes,dr) values (?,?,?)", [model, notes, dr],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Data', res);

            }
        });
};

///DETAIL
exports.tambah_detail_hrd_model = function (req, res) {
    var model = req.body.model;
    var kd_bag = req.body.kd_bag;
    var nm_bag = req.body.nm_bag;
    var proses = req.body.proses;
    var urut_ke = req.body.urut_ke;
    var kode = req.body.kode;
    var item = req.body.item;
    var des1 = req.body.des1;
    var upah = req.body.upah;
    connection.query("insert into hrd_modeld (model,kd_bag,nm_bag,proses,urut_ke,kode,item,des1,upah) values (?,?,?,?,?,?,?,?,?)", [model, kd_bag, nm_bag, proses, urut_ke, kode, item, des1, upah],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok('Berhasil Tambah Kas Detail', res);
            }
        });
};

//update Data HRD Model
exports.ubah_header_hrd_model = function (req, res) {
    var no_id = req.body.no_id;
    var model = req.body.model;
    var notes = req.body.notes;

    connection.query("UPDATE hrd_model SET model=?,notes=? where no_id = ? ", [model, notes, no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Ubah Data', res);

            }
        });

};

//delete Data HRD Model
exports.hapus_hrd_model = function (req, res) {
    var no_id = req.body.no_id;
    connection.query("DELETE FROM hrd_model WHERE no_id=? ", [no_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Hapus Data', res);

            }
        });
};