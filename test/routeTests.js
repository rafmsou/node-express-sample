require('coffee-script').register();

var should = require("should");
var routeConfig = require("../lib/base/routeConfig");

describe("Routes are registered ok", function(){
    
    it("Register all controller routes", function(){
        
        var express = require("express");
        var router = express.Router();
        routeConfig.registerAppRoutes(router);
        
        router.stack.length.should.be.above(0);
    });
});