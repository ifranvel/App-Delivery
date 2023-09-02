const mysql = require("mysql");

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "udemy_delivery"
});

db.connect(function(err){
    if(err) throw err;
    console.log("DATABASE CONECTADA");
});

module.exports = db;