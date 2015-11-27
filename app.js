
require('coffee-script').register();

var express = require('express')
  , path = require('path')
  , http = require('http')
  , bodyParser = require('body-parser')
  , favicon = require('serve-favicon')
  , logger = require('morgan')
  , methodOverride = require('method-override');
  
// Web Configuration and Middlewares
var app = express();
var router = express.Router();

app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(favicon(__dirname + '/public/images/favicon.png'));
app.use(logger('dev'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(methodOverride('_method'));
app.use(express.static(path.join(__dirname, 'public')));
app.locals.basedir = path.join(__dirname, 'views');

if (app.get('env') == 'development') {
	app.locals.pretty = true;
}

// Configuring Passport
var passport = require('passport');
var expressSession = require('express-session');
app.use(expressSession({secret: 'mySecretKey'}));
app.use(passport.initialize());
app.use(passport.session());

// Using the flash middleware provided by connect-flash to store messages in session and displaying in templates
var flash = require('connect-flash');
app.use(flash());

// Initialize Passport
var initPassport = require('./lib/middleware/passport/init');
initPassport(passport);

// Routes Setup
var routeConfig = require('./lib/base/routeConfig');
routeConfig.registerAppRoutes(router);
app.use('/', router);

// Database Setup
// var dbConfig = require('./db.js');
// var mongoose = require('mongoose');
// mongoose.connect(dbConfig.url);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});