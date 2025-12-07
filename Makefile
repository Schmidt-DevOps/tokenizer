
.PHONY: all pub-get test clean format analyze coverage show_coverage clean-coverage

all: test

pub-get:
	flutter pub get

test:
	flutter test

clean: clean-coverage
	flutter clean

clean-coverage:
	rm -rf coverage lcov.info

format:
	flutter format .

analyze:
	flutter analyze

coverage:
	flutter test --coverage

show_coverage:
	# Generate HTML report and open it
	genhtml coverage/lcov.info -o coverage/html
	xdg-open coverage/html/index.html

