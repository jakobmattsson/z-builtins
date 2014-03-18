coreZ = require 'z-core'

describe 'regexps can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'exec', -> @Z(/[a-j]*/).exec('hejsan').should.become ['hej']
  it 'test', -> @Z(/[a-j]*/).test('hejsan').should.become true
