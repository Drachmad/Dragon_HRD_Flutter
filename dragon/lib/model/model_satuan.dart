import 'package:dragon/mysql/koneksi_mysql.dart';

class model_satuan {
  static String table = 'master_satuan';
  koneksi_mysql m_koneksi = koneksi_mysql();

  Future<List> data_satuan() async {
    var konek = await m_koneksi.koneksi();
    var results2 = await konek.query('select * from ' + table);
    await konek.close();
    return results2.toList();
  }

  Future<List> insert_satuan(String satuan) async {
    var konek = await m_koneksi.koneksi();
    var results2 = await konek
        .query('insert into ' + table + ' (nama_satuan) values (?)', [
      satuan,
    ]);
    await konek.close();
    return results2.toList();
  }

  Future<bool> cek_data_satuan(String satuan) async {
    var konek = await m_koneksi.koneksi();
    var results2 = await konek
        .query('select * from ' + table + " where nama_satuan = '$satuan';");
    await konek.close();
    print(results2);
    if (results2.toList() != null && results2.toList().length > 0) {
      return true;
    } else {
      return false;
    }
  }
}
