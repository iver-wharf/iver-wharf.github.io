.PHONY: \
	lint lint-md \
	lint-fix lint-md-fix

deps:
	npm install

lint: lint-md
lint-fix: lint-md-fix

lint-md:
	npx remark . .github

lint-md-fix:
	npx remark . .github -o
