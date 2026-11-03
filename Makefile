
.PHONY: all install run sources build clean

SOURCE_DIRS := .
EXCLUDE_DIRS := ./node_modules ./build ./.git

JS_SOURCES := $(shell find $(SOURCE_DIRS) \
	$(foreach dir,$(EXCLUDE_DIRS),-path $(dir) -prune -o) \
	-type f -name '*.js' -print)

HTML_SOURCES := $(shell find $(SOURCE_DIRS) \
	$(foreach dir,$(EXCLUDE_DIRS),-path $(dir) -prune -o) \
	-type f -name '*.html' -print)

CSS_SOURCES := $(shell find $(SOURCE_DIRS) \
	$(foreach dir,$(EXCLUDE_DIRS),-path $(dir) -prune -o) \
	-type f -name '*.css' -print)

SOURCES := $(JS_SOURCES) $(HTML_SOURCES) $(CSS_SOURCES)

all: build

install:
	npm install

run:
	npm start

sources:
	@printf '%s\n' $(SOURCES)

build: install
	npm run build

clean:
	rm -rf build
