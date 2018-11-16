const express = require("express");
const MongoClient = require("mongodb").MongoClient;
// const url = "mongodb://" + process.env.DATABASE_HOST + ":27017";
const url = `mongodb://${process.env.DATABASE_USER}:${process.env.DATABASE_PASSWORD}@${process.env.DATABASE_HOST}:27017`;

const app = express();
app.get("/api/products", (req, res) => {
	MongoClient.connect(
		url,
		(err, client) => {
			if (err) throw err;
			console.log("Database connected!");

			const db = client.db("shoppers");
			db.collection("products")
				.find()
				.toArray((err, result) => {
					if (err) throw err;
					res.status(200).send(result);
					client.close();
				});
		}
	);
});

app.listen(8080, () => {
	console.log("Listening on port 8080");
});
