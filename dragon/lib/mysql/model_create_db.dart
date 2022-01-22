import 'package:dragon/mysql/koneksi_mysql.dart';

class model_create_db {
  Future<void> buat_tabel_jual_beli() async {
    var konek = await koneksi_mysql().koneksi();
    //brg_coba
    await konek.query('CREATE TABLE IF NOT EXISTS brg_coba ('
            ' `NO_ID`  int(11) NOT NULL AUTO_INCREMENT , ' +
        ' `KD_BRG`  varchar(10) NOT NULL DEFAULT "" , ' +
        ' `NA_BRG`  varchar(100) NOT NULL DEFAULT "" , ' +
        ' `SATUAN`  varchar(30) NOT NULL DEFAULT "" , ' +
        ' PRIMARY KEY (`NO_ID`))');
    //stok_coba
    await konek.query('CREATE TABLE IF NOT EXISTS stok_coba ('
            ' `NO_ID`  int(11) NOT NULL AUTO_INCREMENT , ' +
        ' `NO_BUKTI`  varchar(15) NOT NULL DEFAULT "" , ' +
        ' `TGL`  date NULL DEFAULT "2001-01-01" , ' +
        ' `KD_BRG`  varchar(10) NOT NULL DEFAULT "" , ' +
        ' `NA_BRG`  varchar(100) NOT NULL DEFAULT "" , ' +
        ' `KET`  varchar(30) NOT NULL DEFAULT "" , ' +
        ' `QTY`  decimal(12,2) NOT NULL DEFAULT 0 , ' +
        ' PRIMARY KEY (`NO_ID`))');
    //penjualan
    await konek.query('CREATE TABLE IF NOT EXISTS penjualan ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'no_bukti varchar(255), ' +
        'no_sp varchar(255), ' +
        'tanggal varchar(255), ' +
        'customer varchar(255), ' +
        'kode varchar(255), ' +
        'jatuh_tempo varchar(255), ' +
        'qty double, ' +
        'total double, ' +
        'pajak double, ' +
        'diskon double, ' +
        'keterangan varchar(255))');
    await konek.query('CREATE TABLE IF NOT EXISTS detail_barang_penjualan ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'no_bukti varchar(255), ' +
        'kode_barang varchar(255), ' +
        'nama_barang varchar(255), ' +
        'satuan varchar(255), ' +
        'qty double, ' +
        'harga_so double, ' +
        'harga_jual double, ' +
        'sub_total double)');
    //order penjualan
    await konek.query('CREATE TABLE IF NOT EXISTS order_penjualan ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'no_bukti varchar(255), ' +
        'sales varchar(255), ' +
        'customer varchar(255), ' +
        'tanggal varchar(255), ' +
        'keterangan varchar(255), ' +
        'total_qty double, ' +
        'total_so double, ' +
        'status int)');
    await konek
        .query('CREATE TABLE IF NOT EXISTS detail_barang_order_penjualan ('
                'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
            'no_bukti varchar(255), ' +
            'kode_barang varchar(255), ' +
            'nama_barang varchar(255), ' +
            'satuan varchar(255), ' +
            'qty double, ' +
            'harga_so double, ' +
            'sub_total double)');
    //pembelian
    await konek.query('CREATE TABLE IF NOT EXISTS pembelian ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'no_bukti varchar(255), ' +
        'no_sp varchar(255), ' +
        'tanggal varchar(255), ' +
        'supplier varchar(255), ' +
        'kode varchar(255), ' +
        'jatuh_tempo varchar(255), ' +
        'qty double, ' +
        'total double, ' +
        'pajak double, ' +
        'keterangan varchar(255))');
    await konek.query('CREATE TABLE IF NOT EXISTS detail_barang_pembelian ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'no_bukti varchar(255), ' +
        'kode_barang varchar(255), ' +
        'nama_barang varchar(255), ' +
        'satuan varchar(255), ' +
        'qty double, ' +
        'harga_po double, ' +
        'harga_beli double, ' +
        'sub_total double)');
    //order pembelian
    await konek.query('CREATE TABLE IF NOT EXISTS order_pembelian ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'no_bukti varchar(255), ' +
        'sales varchar(255), ' +
        'supplier varchar(255), ' +
        'tanggal varchar(255), ' +
        'keterangan varchar(255), ' +
        'total_qty double, ' +
        'total_used double, ' +
        'total_po double, ' +
        'status int)');
    await konek
        .query('CREATE TABLE IF NOT EXISTS detail_barang_order_pembelian ('
                'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
            'no_bukti varchar(255), ' +
            'kode_barang varchar(255), ' +
            'nama_barang varchar(255), ' +
            'satuan varchar(255), ' +
            'qty double, ' +
            'harga_po double, ' +
            'sub_total double)');
    //supplier
    await konek.query('CREATE TABLE IF NOT EXISTS master_supplier ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'nama varchar(255), ' +
        'alamat varchar(255), ' +
        'no_tlp varchar(255), ' +
        'keterangan varchar(255))');
    //customer
    await konek.query('CREATE TABLE IF NOT EXISTS master_customer ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'nama varchar(255), ' +
        'alamat varchar(255), ' +
        'no_tlp varchar(255), ' +
        'keterangan varchar(255))');
    //user atau sales
    await konek.query('CREATE TABLE IF NOT EXISTS master_sales ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'nama varchar(255), ' +
        'alamat varchar(255), ' +
        'no_tlp varchar(255), ' +
        'password varchar(255), ' +
        'keterangan varchar(255))');
    //user atau sales
    // role 0 - admin
    // role 1 - manajer
    // role 2 - pbl
    // role 3 = pjl
    await konek.query('CREATE TABLE IF NOT EXISTS master_user ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'nama varchar(255), ' +
        'alamat varchar(255), ' +
        'no_tlp varchar(255), ' +
        'username varchar(255), ' +
        'password varchar(255), ' +
        'keterangan double, ' +
        'role int)');
    //barang
    await konek.query('CREATE TABLE IF NOT EXISTS master_barang ('
            'id int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
        'kode_barang varchar(255), ' +
        'nama_barang varchar(255), ' +
        'harga_beli double, ' +
        'harga_jual double, ' +
        'satuan varchar(255), ' +
        'stok double)');
    await konek.close();
  }
}
