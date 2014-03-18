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

  describe 'get', ->

    it 'returns array indexes', ->
      @Z([1, 2, 3]).get(1).should.become 2

    it 'returns object properties', ->
      @Z({ a: 1 , b: 2 }).get('a').should.become 1

  describe 'if', ->

    it 'runs the given function if the promise is truthy', ->
      called = false
      @Z(1).if(-> called = true).then ->
        called.should.eql true

    it 'does not run the given function if the promise is falsy', ->
      called = false
      @Z(0).if(-> called = true).then ->
        called.should.eql false

    it 'runs the second function if the promise is falsy', ->
      called = false
      @Z(0).if((->), -> called = true).then ->
        called.should.eql true

    it 'does not run the second function if the promise is truthy', ->
      called = false
      @Z(1).if((->), -> called = true).then ->
        called.should.eql false
