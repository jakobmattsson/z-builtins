methods = require './methods'
logging = require './logging'

isArray = Array.isArray || (obj) -> Object.prototype.toString.call(obj) == "[object Array]"

exportMethod = (method) ->
  exports[method] = (args...) ->
    @value[method].apply(@value, args)

for name, func of logging
  exports[name] = func

for method in methods
  exportMethod(method)

exports.isArray = ->
  isArray(@value)

exports.length = ->
  if typeof @value != 'string' && !isArray(@value)
    throw new Error('Function "length" can only be called on strings and arrays')
  @value.length
