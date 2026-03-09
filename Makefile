.PHONY: install start build lint test clean

install:
	npm install

start:
	npm start

build:
	npm run build

lint:
	npx eslint .

test:
	npm test

clean:
	rm -rf node_modules dist build
