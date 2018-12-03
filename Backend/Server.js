let http = require('http');
let mysql = require('mysql');


var pool = mysql.createPool({
	host: 'localhost',
	port: '3306',
	user: 'root',
	password: 'mySQL1234!',
	database: 'recipesearcher',
	multipleStatements: true
});

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 5000;

app.use(express.static('../Frontend'));
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


app.post('/login',function(req,res){
	
    pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.log_in(?,?)',[req.body.username, req.body.password], function(err, rows, fields) {
			connection.release();
			var myval = JSON.parse(JSON.stringify(rows[0]));
			var bool_value = myval[0].boolval == 'true';
			console.log(bool_value);
			if (err) {
				console.log("Error in query");
				console.log(err);
				res.status(400).send(err);
			}
			res.status(200).send(bool_value);
		});
	});

});
//I assume edit recipe is to return a list of all the recipes the particular user has made
app.get('/editRecipe',function(req,res){
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		console.log(req.body.username, req.body.password);
		connection.query('CALL recipesearcher.searchuser(?)',[req.body.username], function(err, rows, fields) {
			connection.release();
			console.log(rows);
			if (err) {
				console.log("Error in query");
				console.log(err);
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
	/*let recTitle = req.body.title;
	let recNum = req.body.number;
	let recDec = req.body.description;
	let recFoodType = req.body.foodType;
	let recIngr = req.body.ingredients;
	let recCook = req.body.cookware;
	let recSteps = req.body.steps;
	let rec.fav = req.body.favourite;
	let username = req.body.username;*/

});

app.post('/recipeUpdate',function(req,res){
	/*let recTitle = req.body.title;
	let recNum = req.body.number;
	let recDec = req.body.description;
	let recFoodType = req.body.foodType;
	let recIngr = req.body.ingredients;
	let recCook = req.body.cookware;
	let recSteps = req.body.steps;
	let rec.fav = req.body.favourite;
	let username = req.body.username;*/
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.edit_recipe(?,?,?,?,?)',[req.body.rnum, req.body.title, req.body.foodtpe, req.body.title, req.body.timetaken, req.body.steps], function(err, rows, fields) {
			connection.release();
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.addedit_ingredients(?,?)',[req.body.ingredients,req.body.rnum], function(err, rows, fields) {
			connection.release();
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.addedit_cookware(?,?)',[req.body.cookware,req.body.rnum], function(err, rows, fields) {
			connection.release();
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});

app.get('/recipeAdd',function(req,res){
	/*let recTitle = req.body.title;
	let recNum = req.body.number;
	let recDec = req.body.description;
	let recFoodType = req.body.foodType;
	let recIngr = req.body.ingredients;
	let recCook = req.body.cookware;
	let recSteps = req.body.steps;
	let rec.fav = req.body.favourite;
	let username = req.body.username;*/
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.add_recipe(?,?,?,?,?)',[req.body.title, req.body.title, req.body.timetaken, req.body.username, req.body.steps], function(err, rows, fields) {
			connection.release();
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.addedit_ingredients(?,?)',[req.body.ingredients,req.body.rnum], function(err, rows, fields) {
			connection.release();
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.addedit_cookware(?,?)',[req.body.cookware,req.body.rnum], function(err, rows, fields) {
			connection.release();
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});

app.post('/register',function(req,res){
	console.log(req.body.username, req.body.password);
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.add_user(?,?)',[req.body.username, req.body.password], function(err, rows, fields) {
			connection.release();
			var myval = JSON.parse(JSON.stringify(rows[0]));
			var bool_value = myval[0].boolval == 'true';
			console.log(bool_value);
			if (err) {
				console.log(err);
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(bool_value);
		});
	});
});

app.get('/recipeData',function(req,res){
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.get_full_recipe(?,?)',[req.body.rno,req.body.username], function(err, rows, fields) {
			connection.release();
			console.log(rows);
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
	/*let recTitle = req.body.title;
	let recNum = req.body.number;
	let recDec = req.body.description;
	let recFoodType = req.body.foodType;
	let recIngr = req.body.ingredients;
	let recCook = req.body.cookware;
	let recSteps = req.body.steps;
	let rec.fav = req.body.favourite;
	let username = req.body.username;*/

});

app.get('/searchfavorites', function(req, res) {	//might need to change function name
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.search_favorites(?)',[req.body.username], function(err, rows, fields) {
			connection.release();
			console.log(rows);
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.get('/searchfood', function(req, res) {	//might need to change function name - function to search by food name
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.search_food(?)',[req.body.foodname], function(err, rows, fields) {
			connection.release();
			console.log(rows);
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.get('/removefavorites', function(req, res) {	//might need to change function name - function takes in username and the recipe-no
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.remove_favorites(?,?)',[req.body.username, req.body.rno], function(err) {
			connection.release();
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.get('/deletereview', function(req, res) {	//might need to change function name
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.delete_review(?,?)',[req.body.rno,req.body.username], function(err) {
			connection.release();
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.delete('/deleterecipe', function(req, res) {	//might need to change function name
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.delete_recipe(?,?)',[req.body.rno,req.body.username], function(err) {
			connection.release();
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.get('/addeditreview', function(req, res) {	//might need to change function name
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.addedit_review(?,?,?)',[req.body.rno,req.body.username,req.body.review], function(err) {
			connection.release();
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.get('/addfavorites', function(req, res) {	//might need to change function name
	pool.getConnection(function (err,connection) {
		if (err) {
			console.log("Error connecting to database");
			res.status(400).send(err);
		}
		connection.query('CALL recipesearcher.add_favorites(?,?)',[req.body.rno, req.body.username], function(err, rows, fields) {
			connection.release();
			console.log(rows);
			if (err) {
				console.log("Error in query");
				res.status(400).send(err);
			}
			res.status(200).send(rows);
		});
	});
});
app.listen(port, () => console.log(`Server listening on port ${port}`));
