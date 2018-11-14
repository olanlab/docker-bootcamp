var express = require("express");
var app = express();

app.get("/", (req, resp) => {
	resp.send("Hello node.js in Docker");
});


app.listen(3000, () => {
	console.log("Server listening on port 3000");
});