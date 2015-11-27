BaseController = require('./baseController')

class AccountController extends BaseController
    constructor: (router) ->
        super(router)
        @passport = require('passport')

    registerRoutes: () ->
        @read('/account/userinfo', (req, res) ->
            userFullName = req.user.fullname
            res.render 'account/userinfo', userFullName: userFullName)
        
        @read('/account/login', ((req, res) -> 
            res.render 'account/login', message: req.flash('message'))
            , true)
    
        @create('/account/login', @passport.authenticate('login',
            successRedirect: '/account/userinfo'
            failureRedirect: '/account/login'
            failureFlash: true))
                
        @read('/account/signup', (req, res) ->
            res.render 'account/signup', message: req.flash('message')
            , true)
        
        @create('/account/signup', @passport.authenticate('signup',
            successRedirect: '/home'
            failureRedirect: '/account/signup'
            failureFlash: true))
    
module.exports = AccountController