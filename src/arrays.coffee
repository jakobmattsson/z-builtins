{arrayMethods} = require './methods'

exportMethod = (method) ->
  exports[method] = (args...) ->
    Array.prototype[method].apply(@value, args)

for method in arrayMethods
  exportMethod(method)
