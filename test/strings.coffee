coreZ = require 'z-core'

describe 'strings can call', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  it 'length', -> @Z("foobar").length().should.become 6
  it 'charAt', -> @Z("foobar").charAt(1).should.become 'o'
  it 'charCodeAt', -> @Z("foobar").charCodeAt(4).should.become 97
  it 'concat', -> @Z("foobar").concat(' ', 'baz').should.become 'foobar baz'
  it 'indexOf', -> @Z("foobar").indexOf('bar').should.become 3
  it 'lastIndexOf', -> @Z("foobar").lastIndexOf('o').should.become 2
  it 'localeCompare', -> @Z("öbo").localeCompare('ystad', 'sv').then (val) -> val.should.eql("öbo".localeCompare("ystad", 'sv'))
  it 'replace', -> @Z("foobar").replace('bar', 'baz').should.become 'foobaz'
  it 'search', -> @Z("foobar").search(/o{2}/).should.become 1
  it 'slice', -> @Z("foobar").slice(2).should.become "obar"
  it 'split', -> @Z("foobar").split('o').should.become ["f", "", "bar"]
  it 'substr', -> @Z("foobar").substr(2, 3).should.become "oba"
  it 'substring', -> @Z("foobar").substring(2, 3).should.become "o"
  it 'toLocaleLowerCase', -> @Z("ÖBO").toLocaleLowerCase('sv').should.become "öbo"
  it 'toLocaleUpperCase', -> @Z("öbo").toLocaleUpperCase('sv').should.become "ÖBO"
  it 'toLowerCase', -> @Z("FOObar").toLowerCase().should.become "foobar"
  it 'toString, but that will always return a string from the promise itself', -> @Z("foobar").toString().should.eql "[object Object]"
  it 'toStr in order to run toString on the promised value', -> @Z("foobar").toStr().should.become "foobar"
  it 'toUpperCase', -> @Z("foobar").toUpperCase().should.become "FOOBAR"
  it 'trim', -> @Z("  foobar").trim().should.become "foobar"



describe 'strings', ->

  beforeEach ->
    @Z = coreZ.init()
    @Z.mixin(zBuiltins)

  es6 = [
    'codePointAt'
    'contains'
    'endsWith'
    'repeat'
    'startsWith'
  ]

  es6.forEach (method) ->
    it "cannot call the ES6-method #{method}", ->
      [@Z("foobar")[method]].should.eql [undefined]
