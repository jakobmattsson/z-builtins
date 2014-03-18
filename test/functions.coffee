coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'functions can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  f = (x, y) -> x * 2 - y + this

  it 'apply', -> @Z(f).apply(1, [5, 6]).should.become 5
  it 'call', -> @Z(f).call(10, 2, 3).should.become 11
  it 'bind', -> @Z(f).bind(10).call(1, 3).should.become 13
