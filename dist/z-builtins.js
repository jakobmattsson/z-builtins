// z-builtins v0.2.1
// Jakob Mattsson 2014-03-18
// Generated by CommonJS Everywhere 0.9.7
(function (global) {
  function require(file, parentModule) {
    if ({}.hasOwnProperty.call(require.cache, file))
      return require.cache[file];
    var resolved = require.resolve(file);
    if (!resolved)
      throw new Error('Failed to resolve module ' + file);
    var module$ = {
        id: file,
        require: require,
        filename: file,
        exports: {},
        loaded: false,
        parent: parentModule,
        children: []
      };
    if (parentModule)
      parentModule.children.push(module$);
    var dirname = file.slice(0, file.lastIndexOf('/') + 1);
    require.cache[file] = module$.exports;
    resolved.call(module$.exports, module$, module$.exports, dirname, file);
    module$.loaded = true;
    return require.cache[file] = module$.exports;
  }
  require.modules = {};
  require.cache = {};
  require.resolve = function (file) {
    return {}.hasOwnProperty.call(require.modules, file) ? require.modules[file] : void 0;
  };
  require.define = function (file, fn) {
    require.modules[file] = fn;
  };
  require.define('/lib/index.js', function (module, exports, __dirname, __filename) {
    (function () {
      var exportArbitraryMethod, exportMethod, exportMutatorMethod, func, global, isArray, logging, method, methods, name, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3, _ref4, __slice = [].slice;
      methods = require('/lib/methods.js', module);
      logging = require('/lib/logging.js', module);
      isArray = Array.isArray || function (obj) {
        return Object.prototype.toString.call(obj) === '[object Array]';
      };
      global = function () {
        return this;
      }();
      exportMethod = function (method) {
        return exports[method] = function () {
          var args;
          args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          return this.value[method].apply(this.value, args);
        };
      };
      exportMutatorMethod = function (method) {
        return exports[method] = function () {
          var args, newValue;
          args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          if (!Array.isArray(this.value)) {
            throw new Error('Must be an array');
          }
          newValue = this.value.slice(0);
          newValue[method].apply(newValue, args);
          return newValue;
        };
      };
      exportArbitraryMethod = function (name, method) {
        return exports[name] = function () {
          var args;
          args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          return method.apply(null, [this.value].concat(__slice.call(args)));
        };
      };
      for (name in logging) {
        func = logging[name];
        exports[name] = func;
      }
      _ref = methods.plain;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        method = _ref[_i];
        exportMethod(method);
      }
      _ref1 = methods.mutators;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        method = _ref1[_j];
        exportMutatorMethod(method);
      }
      _ref2 = methods.globals;
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        method = _ref2[_k];
        exportArbitraryMethod(method, global[method]);
      }
      _ref3 = methods.methods;
      for (name in _ref3) {
        method = _ref3[name];
        exportArbitraryMethod(name, method);
      }
      _ref4 = methods.maths;
      for (_l = 0, _len3 = _ref4.length; _l < _len3; _l++) {
        method = _ref4[_l];
        exportArbitraryMethod(method, Math[method]);
      }
      exports.length = function () {
        if (typeof this.value !== 'string' && !isArray(this.value)) {
          throw new Error('Function "length" can only be called on strings and arrays');
        }
        return this.value.length;
      };
      exports.get = function (property) {
        return this.value[property];
      };
      exports.toStr = function () {
        return this.value.toString();
      };
      exports['if'] = function (f1, f2) {
        if (this.value) {
          return f1();
        } else if (f2) {
          return f2();
        }
      };
    }.call(this));
  });
  require.define('/lib/logging.js', function (module, exports, __dirname, __filename) {
    (function () {
      var log;
      log = function (value) {
        if ((typeof console !== 'undefined' && console !== null ? console.log : void 0) != null) {
          return console.log(value);
        }
      };
      exports.log = function () {
        return log(this.value);
      };
      exports.print = function () {
        var util, v;
        util = require('util', module);
        v = util.inspect(this.value, { depth: null });
        return log(JSON.stringify(this.value));
      };
    }.call(this));
  });
  require.define('util', function (module, exports, __dirname, __filename) {
    (function () {
      exports.inspect = function (value) {
        return JSON.stringify(value);
      };
    }.call(this));
  });
  require.define('/lib/methods.js', function (module, exports, __dirname, __filename) {
    (function () {
      exports.plain = [
        'charAt',
        'charCodeAt',
        'concat',
        'indexOf',
        'lastIndexOf',
        'localeCompare',
        'match',
        'replace',
        'search',
        'slice',
        'split',
        'substr',
        'substring',
        'toLocaleLowerCase',
        'toLocaleUpperCase',
        'toLowerCase',
        'toUpperCase',
        'trim',
        'concat',
        'join',
        'slice',
        'indexOf',
        'lastIndexOf',
        'forEach',
        'every',
        'some',
        'filter',
        'map',
        'reduce',
        'reduceRight',
        'toLocaleString',
        'apply',
        'bind',
        'call',
        'toExponential',
        'toFixed',
        'toLocaleString',
        'toPrecision',
        'exec',
        'test'
      ];
      exports.mutators = [
        'reverse',
        'sort',
        'pop',
        'shift',
        'push',
        'splice',
        'unshift'
      ];
      exports.globals = [
        'eval',
        'isFinite',
        'isNaN',
        'parseFloat',
        'parseInt',
        'decodeURI',
        'decodeURIComponent',
        'encodeURI',
        'encodeURIComponent',
        'escape',
        'unescape'
      ];
      exports.methods = {
        isArray: Array.isArray,
        stringify: JSON.stringify,
        parseJSON: JSON.parse,
        logarithm: Math.log,
        inc: function (x) {
          return x + 1;
        },
        dec: function (x) {
          return x - 1;
        },
        neg: function (x) {
          return -x;
        },
        'typeof': function (x) {
          return typeof x;
        },
        del: function (x, name) {
          delete x[name];
          return x;
        },
        'in': function (prop, obj) {
          return prop in obj;
        },
        'instanceof': function (obj, type) {
          return obj instanceof type;
        },
        mult: function (x, y) {
          return x * y;
        },
        div: function (x, y) {
          return x / y;
        },
        mod: function (x, y) {
          return x % y;
        },
        add: function (x, y) {
          return x + y;
        },
        sub: function (x, y) {
          return x - y;
        },
        bitNot: function (x) {
          return ~x;
        },
        bitAnd: function (x, y) {
          return x & y;
        },
        bitOr: function (x, y) {
          return x | y;
        },
        bitLeft: function (x, y) {
          return x << y;
        },
        bitRight: function (x, y) {
          return x >> y;
        },
        bitRightFill: function (x, y) {
          return x >>> y;
        },
        gt: function (x, y) {
          return x > y;
        },
        gte: function (x, y) {
          return x >= y;
        },
        lt: function (x, y) {
          return x < y;
        },
        lte: function (x, y) {
          return x <= y;
        },
        and: function (x, y) {
          return x && y;
        },
        or: function (x, y) {
          return x || y;
        },
        not: function (x) {
          return !x;
        }
      };
      exports.maths = [
        'abs',
        'acos',
        'asin',
        'atan',
        'atan2',
        'ceil',
        'cos',
        'exp',
        'floor',
        'max',
        'min',
        'pow',
        'round',
        'sin',
        'sqrt',
        'tan'
      ];
    }.call(this));
  });
  global.zBuiltins = require('/lib/index.js');
}.call(this, this));
