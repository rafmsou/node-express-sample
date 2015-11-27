class BaseController
    constructor: (router) ->
        @router = router
    
    create: (routePath, handler) ->
        @router.post routePath, handler
    
    read: (routePath, handler, allowAnonymous) ->
        
        console.log 'allow anonymous', allowAnonymous
        
        if allowAnonymous == true
            @router.get routePath, handler
        else
            @router.get routePath, @isAuthenticated, handler
    
    update: (routePath, handler) ->
        
    delete: (routePath, handler) ->
        console.log 'delete action invoked...'
    
    registerRoutes: () ->
        console.log 'register routes invoked...'

    isAuthenticated: (req, res, next) ->
        # if user is authenticated in the session, call the next() to call the next request handler 
        # Passport adds this method to request object. A middleware is allowed to add properties to
        # request and response objects

        if req.isAuthenticated()
            res.locals.user = req.user
            return next()

        # if the user is not authenticated then redirect him to the login page
        res.redirect '/account/login'

module.exports = BaseController