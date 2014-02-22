{stringMethods} = require './methods'

exportMethod = (method) ->
  exports[method] = (args...) ->
    String.prototype[method].apply(@value, args)

for method in stringMethods
  exportMethod(method)
