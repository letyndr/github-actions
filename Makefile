
black:
	black . --check --line-length 80

isort:
	isort . --check-only

autoflake:
	autoflake --recursive --check --remove-all-unused-imports --remove-unused-variables ./

lint: black isort autoflake

lint-fix:
	@( \
		black . --exclude=.venv; \
		isort --force-single-line-imports --quiet --apply -l=250 .; \
		autoflake --recursive --exclude .venv,__init__.py --in-place --remove-all-unused-imports --ignore-init-module-imports ./; \
		isort --quiet --apply .; \
	)
