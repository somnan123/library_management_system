const mysql = require('mysql2');

const db = mysql.createConnection({
   host: 'localhost',
   user: 'root',
   password: '',
   database: 'react_node_app'
});

module.exports = db;