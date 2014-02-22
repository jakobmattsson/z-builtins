coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'arrays', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'join runs', ->
    @Z([1, 2, 3]).join('-').should.become '1-2-3'
