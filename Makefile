.PHONY: all build rebuild check test memtest clean coverage_tests

all: clean check build test coverage_tests memtest

TARGET_TEST = ./test.out

TARGET_COVERAGE = [789]

clean:
	rm -rf build && rm -rf coverage-report

check:
	./run_linters.sh

build:
	./run_build.sh

rebuild: clean build

test:
	./run_build.sh
	./run_test.sh

coverage_tests:
	./run_build.sh
	./run_coverage.sh $(TARGET_COVERAGE)

memtest:
	./run_build.sh
	./run_memtest.sh $(TARGET_TEST)


