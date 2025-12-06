
.PHONY: all pub-get test clean format analyze

all: pub-get test

pub-get:
	flutter pub get

test:
	flutter test

clean:
	flutter clean

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

clean-coverage:
	rm -rf coverage
	rm -f lcov.info
