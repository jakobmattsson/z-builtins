DATE = $(shell date +'%Y-%m-%d')

CHAI = node_modules/chai/chai.js
CHAI_AS_PROMISED = node_modules/chai-as-promised/lib/chai-as-promised.js

cjsify = node_modules/commonjs-everywhere/bin/cjsify

TEST_FILES = $(shell find test -name *.coffee)
LIBS = $(CHAI) $(CHAI_AS_PROMISED)

MOCHA_PARAMS = --compilers coffee:coffee-script/register --require test/support/node.js


## Creating files and folders
## ==========================================================================

.cov: src/*.coffee
	@jscov --expand --conditionals src .cov

lib: src/*.coffee makefile
	@rm -rf lib
	@coffee -co lib src

tmp:
	@mkdir -p tmp



# Distribution files
# ------------------

tmp/dist-header.txt: package.json tmp
	@echo "// z-builtins v`cat package.json | json version`\n// Jakob Mattsson $(DATE)" > tmp/dist-header.txt

dist/z-builtins.js: lib dist tmp/dist-header.txt
	@$(cjsify) lib/index.js --no-node -x zBuiltins --alias util:./lib/browserInspect.js | cat tmp/dist-header.txt - > dist/z-builtins.js

dist/z-builtins-min.js: lib dist tmp/dist-header.txt
	@$(cjsify) lib/index.js --no-node -x zBuiltins --m --alias util:./lib/browserInspect.js | cat tmp/dist-header.txt - > dist/z-builtins-min.js



# Browser test files
# ------------------

tmp/browsertest:
	@mkdir -p tmp/browsertest

tmp/vendor.js: package.json tmp $(LIBS) test/support/browser.js
	@cat $(LIBS) test/support/browser.js > tmp/vendor.js

tmp/cases.js: package.json tmp $(TEST_FILES)
	@find test -type f -name *.coffee ! -iname "versions.coffee" -exec $(cjsify) {} --no-node \; > tmp/cases.js

tmp/browsertest/default/tests.js: package.json tmp/browsertest tmp/vendor.js tmp/cases.js dist/z-builtins.js
	@mocha init tmp/browsertest/default
	@cat tmp/vendor.js dist/z-builtins.js tmp/cases.js > tmp/browsertest/default/tests.js



## Tasks
## ==========================================================================

clean:
	@rm -rf lib tmp .cov

update-dist: dist/z-builtins.js dist/z-builtins-min.js

compile-browser-tests: tmp/browsertest/default/tests.js

deploy-browser-tests: compile-browser-tests
	@bucketful

test-coverage: .cov
	@JSCOV=.cov mocha --reporter mocha-term-cov-reporter $(MOCHA_PARAMS)

test-node:
	@mocha --grep "$(TESTS)" $(MOCHA_PARAMS)

test-browsers: deploy-browser-tests
	@chalcogen --platform saucelabs

run-tests: lib
ifneq ($(CI),true)
	# Not running CI; only testing in node
	@make test-node
else ifneq ($(TRAVIS_NODE_VERSION),0.10)
	# Running CI in a node version other than 0.10; only testing in node
	@make test-node
else
	# Running CI in a node 0.10 - testing node AND browsers!
	@make test-node
	@make test-browsers
endif
