log = (value) ->
  if console?.log?
    console.log(value)

exports.log = ->
  log(@value)

exports.print = ->
  log(JSON.stringify(@value, null, 2))
