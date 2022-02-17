.PHONY: deps \
	lint lint-md \
	lint-fix lint-fix-md

deps:
	npm install

lint: lint-md
lint-fix: lint-fix-md

lint-md:
	npx remark . .github

lint-fix-md:
	npx remark . .github -o
