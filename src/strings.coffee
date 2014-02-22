{stringMethods} = require './methods'

for method in stringMethods
  exports[method] = (args...) ->
    String.prototype[method].apply(@value, args)
