{arrayMethods} = require './methods'

for method in arrayMethods
  exports[method] = (args...) ->
    Array.prototype[method].apply(@value, args)
