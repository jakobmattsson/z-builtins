coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'strings', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'toUpperCase runs', ->
    @Z("foobar").toUpperCase().should.become 'FOOBAR'

  it 'endsWith is not defined', ->
    method = @Z("foobar").endsWith
    [method].should.eql [undefined]

  it 'can run slice', ->
    @Z("foobar").slice(2).should.become "obar"
