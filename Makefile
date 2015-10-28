TEST_FILES=$(wildcard bench/*.rkt)
TESTS=$(TEST_FILES:bench/%.rkt=%:verify)
SRC=$(wildcard cassius/*)
TIME=$(shell date +%s)
FLAGS=

.PHONY: download deploy

test:
	bash test.sh -j4 $(TESTS)

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

publish:
	rsync -rv reports/ uwplse.org:/var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod a+x /var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod -R a+r /var/www/cassius/reports/$(TIME)/
	@ echo "Uploaded to http://cassius.uwplse.org/reports/$(TIME)/"

download:
	grep ';; python get_bench.py' -R bench/ | cut '-d:' -f2- | cut -c4- | xargs -n1 bash -c

bench/css/%.rkt: get_bench.py get_bench.js
	@ python get_bench.py --name css/$* $(patsubst %,file://%,$(wildcard /home/pavpan/src/csswg-test/css21/$*/*.xht))

reports/%.html: bench/%.rkt $(SRC)
	racket cassius/report.rkt $(FLAGS) -o $@ $<

get-csswg: bench/css/floats.rkt bench/css/margin-padding-clear.rkt
