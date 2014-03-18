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
