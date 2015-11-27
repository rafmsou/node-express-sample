BaseController = require './baseController'

class HomeController extends BaseController

    constructor: (router) ->
        super(router)
    
    registerRoutes: ->
        @read('/', ((req, res) -> res.render 'index', 
            message: req.flash('message')
            currentTime: new Date())
        , true)

        @read('/paramstest', (req, res) ->
            console.log k, req.query[k] for k of req.query
            res.send 'hello from paramstest'
        , true)

    indexAction: () -> 
        console.log 'abacate'

module.exports = HomeController