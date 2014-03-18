coreZ = require 'z-core'
zBuiltins = requireSource 'index'

describe 'arrays can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'isArray', -> @Z([1, 2, 3]).isArray().should.become true
  it 'pop', -> @Z([1, 2, 3]).pop().should.become [1, 2]
  it 'push', -> @Z([1, 2, 3]).push(10).should.become [1, 2, 3, 10]
  it 'reverse', -> @Z([1, 2, 3]).reverse().should.become [3, 2, 1]
  it 'shift', -> @Z([1, 2, 3]).shift().should.become [2, 3]
  it 'sort', -> @Z([1, 8, 3]).sort().should.become [1, 3, 8]
  it 'splice', -> @Z([1, 2, 3]).splice(1, 1, 42, 100).should.become [1, 42, 100, 3]
  it 'unshift', -> @Z([1, 2, 3]).unshift(10).should.become [10, 1, 2, 3]
  it 'concat', -> @Z([1, 2, 3]).concat([4, 5], [6]).should.become [1, 2, 3, 4, 5, 6]
  it 'join', -> @Z([1, 2, 3]).join('-').should.become '1-2-3'
  it 'slice', -> @Z([1, 2, 3, 4, 5]).slice(2).should.become [3, 4, 5]
  it 'toString, but that will always return a string from the promise itself', -> @Z([1,2,3]).toString().should.eql "[object Object]"
  it 'toStr in order to run toString on the promised value', -> @Z([1,2,3]).toStr().should.become "1,2,3"
  it 'toLocaleString', -> @Z([1, 2, 3]).toLocaleString('de-DE').should.become '1,2,3'
  it 'indexOf', -> @Z([1, 2, 3]).indexOf(2).should.become 1
  it 'lastIndexOf', -> @Z([1, 2, 3]).indexOf(2).should.become 1
  it 'every', -> @Z([1, 2, 3]).every((x) -> x % 2 == 0).should.become false
  it 'some', -> @Z([1, 2, 3]).some((x) -> x % 2 == 0).should.become true
  it 'filter', -> @Z([1, 2, 3]).filter((x) -> x % 2 == 0).should.become [2]
  it 'map', -> @Z([1, 2, 3]).map((x) -> x * 2).should.become [2, 4, 6]
  it 'reduce', -> @Z([1, 2, 3]).reduce(((acc, x) -> x + "" + acc),0).should.become "3210"
  it 'reduceRight', -> @Z([1, 2, 3]).reduceRight(((acc, x) -> x + "" + acc),0).should.become "1230"
  it 'forEach', ->
    sum = 0
    @Z([1, 2, 3]).forEach((x) -> sum += x).should.become(undefined).then ->
      sum.should.eql 6



describe 'arrays', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)


  cases = [
    name: 'wrappedObject'
    method: (Z, v, f) ->
      a = v
      f(Z(a)).then ->
        a.should.eql(v)
  ,
    name: 'promise'
    method: (Z, v, f) ->
      a = Z(v)
      f(a).then ->
        a.should.become(v)
  ]

  cases.forEach ({ method, name }) ->

    it "does not mutate the #{name} when pop is called", ->
      method @Z, [1,2,3], (p) -> p.pop()

    it "does not mutate the #{name} when shift is called", ->
      method @Z, [1,2,3], (p) -> p.shift()

    it "does not mutate the #{name} when push is called", ->
      method @Z, [1,2,3], (p) -> p.push(4)

    it "does not mutate the #{name} when unshift is called", ->
      method @Z, [1,2,3], (p) -> p.unshift(4)

    it "does not mutate the #{name} when splice is called", ->
      method @Z, [1,2,3], (p) -> p.splice(1, 1, 42, 100)

    it "does not mutate the #{name} when sort is called", ->
      method @Z, [1,3,2], (p) -> p.sort()

    it "does not mutate the #{name} when reverse is called", ->
      method @Z, [1,2,3], (p) -> p.reverse()



describe 'arrays', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  es6 = [
    'of'
    'entries'
    'find'
    'findIndex'
    'keys'
  ]

  nonStandard = [
    'toSource'
  ]

  es6.forEach (method) ->
    it "cannot call the ES6-method #{method}", ->
      [@Z("foobar")[method]].should.eql [undefined]

  nonStandard.forEach (method) ->
    it "cannot call the non-standard method #{method}", ->
      [@Z("foobar")[method]].should.eql [undefined]
