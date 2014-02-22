logging = require './logging'
arrays = require './arrays'
strings = require './strings'

imports = [logging, arrays, strings]

for imported in imports
  for name, func of imported
    exports[name] = func

exports.isArray = ->
  Array.isArray(@value)

exports.length = ->
  @value.length
