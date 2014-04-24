coreZ = require 'z-core'

describe 'logging', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

    @out = []
    @originalConsoleLog = console.log
    console.log = (s) => @out.push(s)

  afterEach ->
    console.log = @originalConsoleLog



  describe 'print', ->
    
    it 'writes strings', ->
      obj = @Z("foo")
      obj.print().then =>
        @out.length.should.eql 1
        JSON.parse(@out[0]).should.eql 'foo'

    it 'writes arrays', ->
      obj = @Z([1,2,3])
      obj.print().then =>
        @out.length.should.eql 1
        JSON.parse(@out[0]).should.eql [1, 2, 3]

    it 'writes arrays of objects', ->
      obj = @Z([{ a: 1 }, { b: 2 }])
      obj.print().then =>
        @out.length.should.eql 1
        JSON.parse(@out[0]).should.eql [{ a: 1 }, { b: 2 }]

    it 'writes objects', ->
      obj = @Z({ a: 1 })
      obj.print().then =>
        @out.length.should.eql 1
        JSON.parse(@out[0]).should.eql { a: 1 }

    it 'writes nested objects', ->
      obj = @Z({ a: { b: { c: 1 } } })
      obj.print().then =>
        @out.length.should.eql 1
        JSON.parse(@out[0]).should.eql { a: { b: { c: 1 } } }

    it 'writes nicely formatted objects', ->
      obj = @Z({ a: { b: { c: 1 } } })
      obj.print().then =>
        @out.length.should.eql 1
        @out[0].should.eql '{\n  "a": {\n    "b": {\n      "c": 1\n    }\n  }\n}'



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
