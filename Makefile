TIME=$(shell date +%s)
FLAGS=

.PHONY: download deploy publish

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

test:
	raco test src

publish:
	rsync -rv reports/ uwplse.org:/var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod a+x /var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod -R a+r /var/www/cassius/reports/$(TIME)/
	@ echo "Uploaded to http://cassius.uwplse.org/reports/$(TIME)/"

# CSSWG test suite

CSSWG_PATH=$(HOME)/src/csswg-test

bench/css/%.rkt: get_bench.py get_bench.js
	@ sh bench/css/get.sh $* $(patsubst %,file://%,$(wildcard $(CSSWG_PATH)/css21/$*/*.xht))

reports/csswg.html reports/csswg.json: $(wildcard bench/css/*.rkt)
	@ racket src/report.rkt regression $(FLAGS) --index bench/css/index.json --expected bench/css/expected.sexp -o reports/csswg $^

bench/css/index.json:
	xdg-open "http://test.csswg.org/suites/css2.1/20110323/html4/toc.html"
	@ echo "Please run the following code on every linked page and collect the results into bench/css/index.json:"
	@ echo
	@ echo 'k = {}; a = $$("td a"); for (var i = 0; i < a.length; i++) { p = a[i].parentNode; while (p.tagName!="TBODY") p = p.parentNode; k[a[i].textContent] = p.id }; p = document.createElement("pre"); document.body.appendChild(p); p.textContent = JSON.stringify(k)'

# FWT test suite

bench/fwt/%.zip:
	curl -L -s https://freewebsitetemplates.com/download/$*/ > $@

# Not recommended
bench/fwt/%.rkt: get_bench.py get_bench.js bench/fwt/%.zip
	sh bench/fwt/get.sh $*

bench/fwt.rkt: get_bench.py get_bench.js $(wildcard bench/fwt/*.zip)
	sh bench/fwt/get-all.sh `for f in bench/fwt/*.zip; do basename $${f%.zip}; done`

bench/fwt.working.rkt: bench/fwt.rkt reports/fwt.json
	racket src/filter-working.rkt reports/fwt.json <bench/fwt.rkt >bench/fwt.working.rkt

# Debugging aid
/tmp/%/: bench/fwt/%.zip
	unzip -q $< -d /tmp/

reports/fwt.html reports/fwt.json: bench/fwt.rkt
	@ racket src/report.rkt regression $(FLAGS) --show-success --timeout 300 -o reports/fwt $^

reports/vizassert.html reports/vizassert.json: bench/fwt.working.rkt
	@ racket src/report.rkt assertions $(FLAGS) --expected bench/fwt/expected.sexp --aggregate --timeout 600 -o reports/vizassert assertions.vizassert bench/fwt.working.rkt
