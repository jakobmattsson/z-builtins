exports.plain = [
  # Strings
  "charAt"
  "charCodeAt"
  "concat"
  "indexOf"
  "lastIndexOf"
  "localeCompare"
  "match"
  "replace"
  "search"
  "slice"
  "split"
  "substr"
  "substring"
  "toLocaleLowerCase"
  "toLocaleUpperCase"
  "toLowerCase"
  "toUpperCase"
  "trim"

  # Arrays
  "concat"
  "join"
  "slice"
  "indexOf"
  "lastIndexOf"
  "forEach"
  "every"
  "some"
  "filter"
  "map"
  "reduce"
  "reduceRight"
  "toLocaleString"

  # Functions
  'apply'
  'bind'
  'call'

  # Numbers
  'toExponential'
  'toFixed'
  'toLocaleString'
  'toPrecision'

  # RegExps
  'exec'
  'test'
]

exports.mutators = [
  "reverse"
  "sort"
  "pop"
  "shift"
  "push"
  "splice"
  "unshift"
]

exports.globals = [
  'eval'
  'isFinite'
  'isNaN'
  'parseFloat'
  'parseInt'
  'decodeURI'
  'decodeURIComponent'
  'encodeURI'
  'encodeURIComponent'
  'escape'
  'unescape'
]

exports.methods = {
  isArray: Array.isArray
  stringify: JSON.stringify
  parseJSON: JSON.parse
  logarithm: Math.log

  inc: (x) -> x + 1
  dec: (x) -> x - 1
  neg: (x) -> -x
  typeof: (x) -> typeof x
  del: (x, name) -> delete x[name]; x
  in: (prop, obj) -> prop of obj
  instanceof: (obj, type) -> obj instanceof type
  mult: (x, y) -> x * y
  div: (x, y) -> x / y
  mod: (x, y) -> x % y
  add: (x, y) -> x + y
  sub: (x, y) -> x - y
  bitNot: (x) -> ~x
  bitAnd: (x, y) -> x & y
  bitOr: (x, y) -> x | y
  bitLeft: (x, y) -> x << y
  bitRight: (x, y) -> x >> y
  bitRightFill: (x, y) -> x >>> y
  gt: (x, y) -> x > y
  gte: (x, y) -> x >= y
  lt: (x, y) -> x < y
  lte: (x, y) -> x <= y
  and: (x, y) -> x && y
  or: (x, y) -> x || y
  not: (x) -> !x
}

exports.maths = [
  'abs'
  'acos'
  'asin'
  'atan'
  'atan2'
  'ceil'
  'cos'
  'exp'
  'floor'
  # 'log' # implemented as "logarithm" instead
  'max'
  'min'
  'pow'
  'round'
  'sin'
  'sqrt'
  'tan'
]
