coreZ = require 'z-core'

describe 'maths provides', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'abs', -> @Z(-1).abs().should.become 1
  it 'acos', -> @Z(1).acos().then (x) -> x.should.eql Math.acos(1)
  it 'asin', -> @Z(1).asin().then (x) -> x.should.eql Math.asin(1)
  it 'atan', -> @Z(1).atan().then (x) -> x.should.eql Math.atan(1)
  it 'atan2', -> @Z(1).atan2().then (x) -> x.should.eql Math.atan2(1)
  it 'ceil', -> @Z(1.2).ceil().should.become 2
  it 'cos', -> @Z(1).cos().then (x) -> x.should.eql Math.cos(1)
  it 'exp', -> @Z(1).exp().should.become Math.E
  it 'floor', -> @Z(1.2).floor().should.become 1
  it 'logarithm', -> @Z(1).logarithm().should.become 0
  it 'max', -> @Z(1).max(2, 3).should.become 3
  it 'min', -> @Z(1).min(2, 3).should.become 1
  it 'pow', -> @Z(2).pow(3).should.become 8
  it 'round', -> @Z(1.2).round().should.become 1
  it 'sin', -> @Z(1).sin().then (x) -> x.should.eql Math.sin(1)
  it 'sqrt', -> @Z(2).sqrt().should.become Math.SQRT2
  it 'tan', -> @Z(1).tan().then (x) -> x.should.eql Math.tan(1)
