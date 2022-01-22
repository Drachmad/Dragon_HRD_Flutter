import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class koneksi_mysql {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;

  Future<MySqlConnection> koneksi() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'qwerty',
      db: 'dragonhrddb',
    ));
    return conn;

    // await conn.close();
  }
}
