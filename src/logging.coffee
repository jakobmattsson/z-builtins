log = (value) ->
  if console?.log?
    console.log(value)

exports.log = ->
  log(@value)

exports.print = ->
  util = require 'util'
  v = util.inspect(@value, { depth: null })
  log(v)
