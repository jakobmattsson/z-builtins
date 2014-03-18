coreZ = require 'z-core'

describe 'numbers can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'toExponential', -> @Z(12345).toExponential(1).should.become '1.2e+4'
  it 'toFixed', -> @Z(1.2345).toFixed(2).should.become '1.23'
  it 'toLocaleString', -> @Z(1.2).toLocaleString("en-IN").then (x) -> x.should.eql (1.2).toLocaleString("en-IN")
  it 'toPrecision', -> @Z(1.234).toPrecision(2).should.become '1.2'
