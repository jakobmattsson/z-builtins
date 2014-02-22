coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'arrays', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'can run join', ->
    @Z([1, 2, 3]).join('-').should.become '1-2-3'

  it 'can run slice', ->
    @Z([1, 2, 3, 4, 5]).slice(2).should.become [3, 4, 5]
