const express = require("express");
const MongoClient = require("mongodb").MongoClient;
const url = "mongodb://" + process.env.DATABASE_HOST + ":27017";

const app = express();
app.get("/", (req, res) => {
	MongoClient.connect(
		url,
		(err, client) => {
			if (err) throw err;
			console.log("Database connected!");

			const db = client.db("shopper");
			db.collection("users").findOne({ status: "pending" }, function(err, result) {
				if (err) throw err;
				res.send(result);

				client.close();
			});
		}
	);
});

app.listen(8080, () => {
	console.log("Listening on port 8080");
});
