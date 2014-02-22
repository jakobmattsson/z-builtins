logging = require './logging'
arrays = require './arrays'
strings = require './strings'

imports = [logging, arrays, strings]

for imported in imports
  for name, func of imported
    exports[name] = func


isArray = Array.isArray || (obj) -> Object.prototype.toString.call(obj) == "[object Array]"

exports.isArray = ->
  isArray(@value)

exports.length = ->
  if typeof @value != 'string' && !isArray(@value)
    throw new Error('Function "length" can only be called on strings and arrays')
  @value.length
