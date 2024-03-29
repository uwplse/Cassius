TIME=$(shell date +%s)
FLAGS=

CAPTURE=python3 capture/capture.py

.PHONY: deploy test nightly publish index clean setup

test:
	raco test src

publish:
	rsync -rv reports/ uwplse.org:/var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod a+x /var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod -R a+r /var/www/cassius/reports/$(TIME)/
	@ echo "Uploaded to http://cassius.uwplse.org/reports/$(TIME)/"
	$(MAKE) index

index:
	bash infra/publish.sh download index upload

clean:
	rm -f bench/css/*.rkt bench/fwt.rkt bench/fwt.working.rkt reports/*.html reports/*.json reports/*.cache

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

nightly:
	bash infra/test.sh
	$(MAKE) publish

setup: capture/all.js

# We do not exactly need Rollup or Webpack here...
capture/all.js: $(wildcard capture/*.ts) capture/tsconfig.json capture/shim.js capture/esprima.js
	tsc --project capture/ && cat capture/esprima.js capture/shim.js >> $@

# CSSWG test suite

CSSWG_PATH=$(HOME)/src/web-platform-tests/css/CSS2

bench/css/%.rkt: capture/capture.py capture/all.js
	@ $(CAPTURE) --output bench/css/$*.rkt $(wildcard $(CSSWG_PATH)/$*/*.xht)

reports/csswg.html reports/csswg.json: $(wildcard bench/css/*.rkt)
	racket src/report.rkt regression $(FLAGS) --index bench/css/index.json --expected bench/css/expected.sexp -o reports/csswg $^

bench/css/index.json:
	xdg-open "http://test.csswg.org/suites/css2.1/20110323/html4/toc.html"
	@ echo "Please run the following code on every linked page and collect the results into bench/css/index.json:"
	@ echo
	@ echo 'k = {}; a = $$("td a"); for (var i = 0; i < a.length; i++) { p = a[i].parentNode; while (p.tagName!="TBODY") p = p.parentNode; k[a[i].textContent] = p.id }; p = document.createElement("pre"); document.body.appendChild(p); p.textContent = JSON.stringify(k)'

# FWT test suite

FWT_PATH=$(HOME)/src/fwt

bench/fwt.rkt: capture/capture.py capture/all.js $(wildcard $(FWT_PATH)/*/*/)
# Note that the "2-with-javascript" bit handles a special case for the childrensappwebsitetemplate
	@ $(CAPTURE) --output bench/fwt.rkt \
	    $(shell find $(wildcard $(FWT_PATH)/*/*) \
	        -name 'index.html' -not -path '*2-with-javascript*')

bench/fwt.working.rkt bench/fwt.broken.rkt: bench/fwt.rkt reports/fwt.json
	<bench/fwt.rkt racket infra/filter-working.rkt reports/fwt.json bench/fwt.working.rkt bench/fwt.broken.rkt

# Debugging aid
/tmp/%/: $(FWT_PATH)/%.zip
	unzip -q $< -d /tmp/

reports/fwt.html reports/fwt.json: bench/fwt.rkt
	racket src/report.rkt regression $(FLAGS) --cache reports/fwt.cache --show-all --timeout 900 -o reports/fwt $^
	python3 capture/minimize.py --cache reports/fwt.cache reports/fwt.json
	racket src/report.rkt rerender --show-all -o reports/fwt reports/fwt.json

reports/vizassert.html reports/vizassert.json: bench/fwt.working.rkt
	racket src/report.rkt assertions $(FLAGS) --cache reports/fwt.cache --expected bench/fwt/expected.sexp --show-all --timeout 1800 -o reports/vizassert bench/assertions/assertions.vizassert bench/fwt.working.rkt

reports/specific.html reports/specific.json: bench/fwt.rkt bench/assertions/specific.sexp
	racket src/report.rkt specific-assertions $(FLAGS) --cache reports/fwt.cache --expected bench/fwt/expected.sexp --show-all --timeout 1800 -o reports/specific bench/assertions/specific.vizassert bench/fwt.rkt bench/assertions/specific.sexp

reports/modular.html reports/modular.json: bench/fwt.proof bench/joel.proof
	racket src/report.rkt proofs $(FLAGS) --show-all --timeout 600 -o reports/modular $^

# Joel on Software blog posts
bench/joel.rkt: bench/joel/joel.js capture/all.js
	python3 capture/capture.py --output bench/joel.rkt --prerun bench/joel/joel.js \
		"https://www.joelonsoftware.com/2018/04/13/gamification/" \
		"https://www.joelonsoftware.com/2018/04/06/the-stack-overflow-age/" \
		"https://preview.arraythemes.com/editor/2014/05/11/knobs-buttons-and-dials/"

# IAG test suite

bench/bugs.rkt: capture/capture.py capture/all.js $(wildcard bench/bugs/*)
	@ $(CAPTURE) --output "$@" $(wildcard bench/bugs/*.html)

reports/bugs.html: bench/bugs.rkt
	racket src/report.rkt regression $(FLAGS) -o reports/bugs $^

# Induction test suite
bench/induction.rkt: capture/capture.py capture/all.js bench/induction/list.html bench/induction/prerun.js
	@ $(CAPTURE) --output "$@" --prerun bench/induction/prerun.js \
		'bench/induction/list.html#0' 'bench/induction/list.html#1' \
		'bench/induction/list.html#2' 'bench/induction/list.html#3' \
		'bench/induction/list.html#4' 'bench/induction/list.html#5' \
		'bench/induction/list.html#50'

reports/induction.html reports/induction.json: bench/induction.proof bench/induction.rkt
	racket src/report.rkt proofs $(FLAGS) --show-all --cache reports/induction.cache --timeout 600 -o reports/induction $<
