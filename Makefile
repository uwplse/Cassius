CSSWG_PATH=$(HOME)/src/csswg-test
TEST_FILES=$(wildcard bench/*.rkt)
TESTS=$(TEST_FILES:bench/%.rkt=%:verify)
SRC=$(wildcard cassius/*)
TIME=$(shell date +%s)
FLAGS=

.PHONY: download deploy publish

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

publish:
	rsync -rv reports/ uwplse.org:/var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod a+x /var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod -R a+r /var/www/cassius/reports/$(TIME)/
	@ echo "Uploaded to http://cassius.uwplse.org/reports/$(TIME)/"

bench/css/%.rkt: get_bench.py get_bench.js
	@ xvfb-run -s '-screen 0 1920x10800x24' python2 get_bench.py --name css/$* $(patsubst %,file://%,$(wildcard $(CSSWG_PATH)/css21/$*/*.xht))

bench/freewebtemplates/%.rkt: get_bench.py get_bench.js bench/alexa/%.html
	sh bench/freewebtemplates.sh $*

reports/csswg.html reports/csswg.json: $(wildcard bench/css/*.rkt)
	racket src/report.rkt $(FLAGS) --index tests.json -o reports/csswg regression $^

rerun-tests:
	racket src/report.rkt $(FLAGS) --supported --failed reports/csswg.json --index tests.json -o reports/csswg regression $(wildcard bench/css/*.rkt)
