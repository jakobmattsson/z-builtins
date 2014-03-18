var chai = require('chai');
var jscov = require('jscov');
var chaiAsPromised = require('chai-as-promised');
var global = (function() { return this; }());

chai.should();
chai.use(chaiAsPromised);

global.zBuiltins = require(jscov.cover('../..', 'lib', 'index'));
