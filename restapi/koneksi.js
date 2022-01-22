var mysql = require('mysql');
//buat koneksi database
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'qwerty',
    database: 'dragonhrddb',
    port: '3306'


});

conn.connect((err) => {
    if (err) throw err;
    console.log('Mysql is Connected!');
});

module.exports = conn;
