SOURCES = $(wildcard src/*.ts)
SPECS   = $(wildcard src/spec/*.ts)

JS_SOURCES = $(SOURCES:src/%.ts=dist/%.js)
JS_SPECS   = $(SPECS:src/spec/%.ts=dist/spec/%.js)

export JASMINE_CONFIG_PATH = ./src/spec/jasmine.json

default: spec

dist/%.js: src/%.ts
	@mkdir -p dist
	./node_modules/.bin/tsc --outDir ./dist $<

dist/spec/%.js: spec/%.ts
	@mkdir -p dist/spec
	./node_modules/.bin/tsc --outDir ./dist $<

SPEC ?=
spec: $(JS_SPECS)
	./node_modules/.bin/jasmine $(SPEC)

clean:
	rm -rf ./dist

.PHONY: default clean spec
