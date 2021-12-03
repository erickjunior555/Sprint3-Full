var mysql = require('mysql');
var connection = mysql.createConnection({
    host     : 'sprint-grupo-3.database.windows.net',
    port     : '1433',
    user     : 'grupo3termovinhos',
    password : '#grupo3SPTECH',
    database : 'Termovinhos'
});

connection.connect(function(err) {
    if (err) throw err;
    console.log('Conectado com sucesso!')
});



module.exports = connection;
