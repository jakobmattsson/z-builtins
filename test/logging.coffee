coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'logging', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

    @out = []
    @originalConsoleLog = console.log
    console.log = (s) => @out.push(s)

  afterEach ->
    console.log = @originalConsoleLog



  describe 'put', ->
    
    it 'writes strings', ->
      obj = @Z("foo")
      obj.print().then =>
        @out.should.eql ["'foo'"]

    it 'writes arrays', ->
      obj = @Z([1,2,3])
      obj.print().then =>
        @out.should.eql ["[ 1, 2, 3 ]"]

    it 'writes arrays of objects', ->
      obj = @Z([{ a: 1 }, { b: 2 }])
      obj.print().then =>
        @out.should.eql ["[ { a: 1 }, { b: 2 } ]"]

    it 'writes objects', ->
      obj = @Z({ a: 1 })
      obj.print().then =>
        @out.should.eql ["{ a: 1 }"]

    it 'writes nested objects', ->
      obj = @Z({ a: { b: { c: 1 } } })
      obj.print().then =>
        @out.should.eql ["{ a: { b: { c: 1 } } }"]



  describe 'log', ->

    it 'writes strings', ->
      obj = @Z("foo")
      obj.log().then =>
        @out.should.eql ['foo']

    it 'writes arrays', ->
      obj = @Z([1,2,3])
      obj.log().then =>
        @out.should.eql [[ 1, 2, 3 ]]

    it 'writes arrays of objects', ->
      obj = @Z([{ a: 1 }, { b: 2 }])
      obj.log().then =>
        @out.should.eql [[ { a: 1 }, { b: 2 } ]]

    it 'writes objects', ->
      obj = @Z({ a: 1 })
      obj.log().then =>
        @out.should.eql [{ a: 1 }]

    it 'writes nested objects', ->
      obj = @Z({ a: { b: { c: 1 } } })
      obj.log().then =>
        @out.should.eql [{ a: { b: { c: 1 } } }]
