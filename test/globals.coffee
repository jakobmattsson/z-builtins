coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'any promise can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'isArray', -> @Z([1, 2, 3]).isArray().should.become true
  it 'eval', -> @Z("1+5").eval().should.become 6
  it 'isFinite', -> @Z(5).isFinite().should.become true
  it 'isNaN', -> @Z(5).isNaN().should.become false
  it 'parseFloat', -> @Z("1.23").parseFloat().should.become 1.23
  it 'parseInt', -> @Z("10").parseInt(8).should.become 8
  it 'decodeURI', -> @Z("a%20=%20b").decodeURI().should.become "a = b"
  it 'decodeURIComponent', -> @Z("a%20%3D%20b").decodeURIComponent().should.become "a = b"
  it 'encodeURI', -> @Z("a = b").encodeURI().should.become "a%20=%20b"
  it 'encodeURIComponent', -> @Z("a = b").encodeURIComponent().should.become "a%20%3D%20b"
  it 'escape', -> @Z("'").escape().should.become "%27"
  it 'unescape', -> @Z("%27").unescape().should.become "'"
