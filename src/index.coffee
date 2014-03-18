methods = require './methods'
logging = require './logging'

isArray = Array.isArray || (obj) -> Object.prototype.toString.call(obj) == "[object Array]"


global = do -> this

exportMethod = (method) ->
  exports[method] = (args...) ->
    @value[method].apply(@value, args)

exportMutatorMethod = (method) ->
  exports[method] = (args...) ->
    throw new Error("Must be an array") if !Array.isArray(@value)
    newValue = @value.slice(0)
    newValue[method].apply(newValue, args)
    newValue
    #newValue = @value
    #newValue[method].apply(newValue, args)
    #newValue

exportArbitraryMethod = (name, method) ->
  exports[name] = (args...) ->
    method(@value, args...)

for name, func of logging
  exports[name] = func

for method in methods.plain
  exportMethod(method)

for method in methods.mutators
  exportMutatorMethod(method)

for method in methods.globals
  exportArbitraryMethod(method, global[method])

for name, method of methods.methods
  exportArbitraryMethod(name, method)

for method in methods.maths
  exportArbitraryMethod(method, Math[method])


exports.length = ->
  if typeof @value != 'string' && !isArray(@value)
    throw new Error('Function "length" can only be called on strings and arrays')
  @value.length

exports.get = (property) ->
  @value[property]

exports.toStr = ->
  @value.toString()

exports.if = (f1, f2) ->
  if @value
    f1()
  else if f2
    f2()
