coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'if-else', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'runs an if-statement if the promise is truthy', ->
    calls = 0
    @Z(1).if(-> calls++).then ->
      calls.should.eql 1

  it 'does not run an if-statement if the promise is falsy', ->
    calls = 0
    @Z(0).if(-> calls++).then ->
      calls.should.eql 0
