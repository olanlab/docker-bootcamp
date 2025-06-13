const express = require("express");
const mysql = require("mysql2");

var con = mysql.createConnection({
	host: process.env.DATABASE_HOST || "127.0.0.1",
	user: "admin",
	password: "1111",
	database: "api_db",
	port: 3306
});

con.connect(function (err) {
	if (err) throw err;
	console.log("Connected!");
});

const app = express();
app.get("/", (req, res) => {
	con.query("SELECT * FROM Users", function (err, result) {
		if (err) throw err;
		res.send(result);
	});
});

app.listen(8080, () => {
	console.log("Listening on port 8080");
});
