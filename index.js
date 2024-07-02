import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import session from "express-session";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "quotenation",
  password: "cow@2022",
  port: 5432,
});
db.connect();

app.use(session({
  secret: 'quote',
  resave: false,
  saveUninitialized: false
}));

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

async function getRandomQuotes(category) {
  let query = "SELECT * FROM quotes_data";
  const values = [];

  if (category) {
    query += " WHERE category = $1";
    values.push(category);
  }

  query += " ORDER BY RANDOM() LIMIT 4"; 

  const result = await db.query(query, values);
  return result.rows;
}

app.get("/", async (req, res) => {
  try {
    const loggedIn = req.session.username ? true : false;
    const category = req.query.category;
    const quotes = await getRandomQuotes(category);

    res.render("index", { loggedIn: loggedIn, quotes: quotes });
    
  } catch (error) {
    console.error("Error fetching quotes:", error);
    res.render("index", { error: "An error occurred while fetching quotes." });
  }
});

app.get("/quotes", async (req, res) => {
  const category = req.query.category;

  try {
    const quotes = await getRandomQuotes(category);
    res.json({ quotes });
  } catch (error) {
    console.error("Error fetching quotes:", error);
    res.status(500).json({ error: "An error occurred while fetching quotes." });
  }
});

app.get("/logout", (req, res) => {
  req.session.destroy();
  res.redirect("/");
});

app.get("/signup", (req, res) => {
  res.render("signup");
});

app.get("/submit", (req, res) => {
  res.render("submit");
});

app.get("/login", (req, res) => {
  res.render("login");
});

app.post("/submit-signup", async (req, res) => {
  const { username, email, password, confirm_password } = req.body;

  try {
    if (password !== confirm_password) {
      return res.render("signup", { error: "Passwords do not match" });
    }

    const userCheckQuery = 'SELECT * FROM user_data WHERE username = $1 OR email = $2';
    const userCheckResult = await db.query(userCheckQuery, [username, email]);

    if (userCheckResult.rows.length > 0) {
      return res.render("signup", { error: "Username or Email already exists" });
    }

    const insertUserQuery = 'INSERT INTO user_data (username, email, password) VALUES ($1, $2, $3)';
    await db.query(insertUserQuery, [username, email, password]);

    res.redirect("/");
  } catch (error) {
    console.error("Error during signup:", error);
    res.render("signup", { error: "An error occurred. Please try again later." });
  }
});

app.post("/submit-login", async (req, res) => {
  const { username, password } = req.body;

  try {
    const userQuery = 'SELECT * FROM user_data WHERE username = $1';
    const { rows } = await db.query(userQuery, [username]);

    if (rows.length === 0) {
      return res.render("login", { error: "Username not found" });
    }

    const user = rows[0];
    if (user.password !== password) {
      return res.render("login", { error: "Incorrect password" });
    }

    req.session.username = username;

    res.redirect("/");
  } catch (error) {
    console.error("Error during login:", error);
    res.render("login", { error: "An error occurred. Please try again later." });
  }
});

app.post("/submit-submit", async (req, res) => {
  const { quote, categories_choose } = req.body;

  try {
    const username = req.session.username;
    const insertQuoteQuery = "INSERT INTO quotes_data (username, quotes, category) VALUES ($1, $2, $3)";
    await db.query(insertQuoteQuery, [username, quote, categories_choose]);

    res.render("submit", { success: "Quote submitted successfully!" });
  } catch (error) {
    console.error("Error submitting quote:", error);
    res.render("submit", { error: "An error occurred. Please try again later." });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
