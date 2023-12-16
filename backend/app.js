// app.js
const express = require("express");
const routes = require("./routes"); // Import the routes module
const dotenv = require("dotenv");
const bodyParser = require('body-parser');
dotenv.config();
const app = express();
const port = process.env.PORT || 5000;
// Use body-parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
// Use the routes defined in routes.js
app.use("/", routes);

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
