coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'other', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  describe 'length', ->

    it 'gets the length of an array', ->
      @Z([1,2,3]).length().should.become 3

    it 'gets the length of a string', ->
      @Z("foobar").length().should.become 6

    it 'fails if run on a number', ->
      @Z(5).length().should.be.rejected

  describe 'isArray', ->

    it 'returns true for arrays', ->
      @Z([1, 2, 3]).isArray().should.become true

    it 'returns false for strings', ->
      @Z("foobar").isArray().should.become false
