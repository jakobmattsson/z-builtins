coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'json can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  f = (x, y) -> x * 2 - y + this

  it 'parseJSON', -> @Z('{ "a": 2 }').parseJSON().should.become { a: 2 }
  it 'stringify', -> @Z({ b: [1, 2] }).stringify().should.become '{"b":[1,2]}'
