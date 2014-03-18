coreZ = require 'z-core'

describe 'functions can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  f = (x, y) -> x * 2 - y + this.v

  it 'apply', -> @Z(f).apply({ v: 1 }, [5, 6]).should.become 5
  it 'call', -> @Z(f).call({ v: 10 }, 2, 3).should.become 11
  it 'bind', -> @Z(f).bind({ v: 10 }).call(9000, 3, 2).should.become 14
