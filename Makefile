TEST_FILES=$(wildcard bench/*.rkt)
TESTS=$(TEST_FILES:bench/%.rkt=%:verify)

.PHONY: download deploy

test:
	bash test.sh -j4 $(TESTS)

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

download:
	grep ';; python get_bench.py' -R bench/ | cut '-d:' -f2- | cut -c4- | xargs -n1 bash -c

bench/css/%.rkt: Makefile get_bench.py get_bench.js
	python get_bench.py --name css/$* $(patsubst %,file://%,$(wildcard /home/pavpan/src/csswg-test/css21/$*/*.xht))

get-csswg: bench/css/floats.rkt bench/css/margin-padding-clear.rkt

test-csswg-%: #bench/css/%.rkt
	bash test.sh -j8 $(shell seq -f css/$*:doc-%g 76 500)
