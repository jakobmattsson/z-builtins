coreZ = require 'z-core'

describe 'operator', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'get returns array indexes', -> @Z([1, 2, 3]).get(1).should.become 2
  it 'get returns object properties', -> @Z({ a: 1 , b: 2 }).get('a').should.become 1
  it 'inc', -> @Z(5).inc().should.become 6
  it 'dec', -> @Z(5).dec().should.become 4
  it 'neg', -> @Z(5).neg().should.become -5
  it 'typeof', -> @Z("foobar").typeof().should.become "string"
  it 'del', -> @Z({ a: 1, b: 2 }).del('b').should.become { a: 1 }
  it 'in', -> @Z('length').in([1,2,3]).should.become true
  it 'instanceof', -> @Z(new String('foobar')).instanceof(String).should.become true
  it 'mult', -> @Z(5).mult(2).should.become 10
  it 'div', -> @Z(5).div(2).should.become 2.5
  it 'mod', -> @Z(5).mod(2).should.become 1
  it 'add', -> @Z(5).add(2).should.become 7
  it 'sub', -> @Z(5).sub(2).should.become 3

  it 'bitNot', -> @Z(5).bitNot().should.become -6
  it 'bitAnd', -> @Z(5).bitAnd(1).should.become 1
  it 'bitOr', -> @Z(5).bitOr(3).should.become 7
  it 'bitLeft', -> @Z(4).bitLeft(2).should.become 16
  it 'bitRight', -> @Z(5).bitRight(2).should.become 1
  it 'bitRightFill', -> @Z(5).bitRightFill(2).should.become 1

  it 'gt', -> @Z(5).gt(2).should.become true
  it 'gte', -> @Z(5).gte(2).should.become true
  it 'lt', -> @Z(5).lt(2).should.become false
  it 'lte', -> @Z(5).lte(2).should.become false

  it 'and', -> @Z(5).and(false).should.become false
  it 'or', -> @Z(5).or(2).should.become 5
  it 'not', -> @Z(5).not().should.become false

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
