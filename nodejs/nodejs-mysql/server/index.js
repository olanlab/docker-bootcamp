const express = require("express");
const mysql = require("mysql");

var con = mysql.createConnection({
	host: process.env.DATABASE_HOST || "127.0.0.1",
	user: "olan",
	password: "1234",
	database: "OLANLAB",
	port: 3306
});

con.connect(function(err) {
	if (err) throw err;
	console.log("Connect!");
});

const app = express();
app.get("/", (req, res) => {
	con.query("SELECT * FROM USER", function(err, result) {
		if (err) throw err;
		res.send(result);
	});
});

app.listen(8080, () => {
	console.log("Listening on port 8080");
});
