var chai = require('chai');
var jscov = require('jscov');
var chaiAsPromised = require('chai-as-promised');

chai.should();
chai.use(chaiAsPromised);

var global = (function() { return this; }());

global.requireSource = function(name) {
  return require(jscov.cover('../..', 'lib', name));
};
