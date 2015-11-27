
class RouteConfig

    registerAppRoutes: (router) ->
        
        appRoot = process.env.PWD

        controllers = require('require-all')(
          dirname     :     appRoot + '/lib/controllers'
          filter      :     /(.+Controller)\.coffee$/
          excludeDirs :     /^\.(git|svn)$/
          recursive   :     true
          resolve     :     (Controller) ->
              return new Controller(router).registerRoutes()
        )

module.exports = new RouteConfig()