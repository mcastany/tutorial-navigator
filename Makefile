ifndef PORT
  PORT=8989
endif

run: build

dev-run:
	@node_modules/.bin/supervisor \
		--quiet \
		--force-watch \
		-e js,css,html,json,jade \
		-i node_modules,components,build \
		-x make -q dev-build

build: packages
	@node node_modules/.bin/component-build

dev-build: build
	@node_modules/.bin/serve --port $(PORT)

packages: node_modules
	@node node_modules/.bin/component-install

node_modules:
	@npm install --development

.PHONY: build