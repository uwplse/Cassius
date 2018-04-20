TIME=$(shell date +%s)
FLAGS=

.PHONY: deploy test nightly publish index clean

test:
	raco test src

publish:
	rsync -rv reports/ uwplse.org:/var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod a+x /var/www/cassius/reports/$(TIME)/
	ssh uwplse.org chmod -R a+r /var/www/cassius/reports/$(TIME)/
	@ echo "Uploaded to http://cassius.uwplse.org/reports/$(TIME)/"

index:
	bash infra/publish.sh download index upload

clean:
	rm -f bench/css/*.rkt bench/fwt.rkt bench/fwt.working.rkt reports/*.html reports/*.json

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

nightly:
	bash infra/test.sh
	$(MAKE) publish

# CSSWG test suite

CSSWG_PATH=$(HOME)/src/web-platform-tests/css/CSS2

bench/css/%.rkt: get_bench.py get_bench.js
	@ sh bench/css/get.sh $* $(patsubst %,file://%,$(wildcard $(CSSWG_PATH)/$*/*.xht))

reports/csswg.html reports/csswg.json: $(wildcard bench/css/*.rkt)
	racket src/report.rkt regression $(FLAGS) --index bench/css/index.json --expected bench/css/expected.sexp -o reports/csswg $^

bench/css/index.json:
	xdg-open "http://test.csswg.org/suites/css2.1/20110323/html4/toc.html"
	@ echo "Please run the following code on every linked page and collect the results into bench/css/index.json:"
	@ echo
	@ echo 'k = {}; a = $$("td a"); for (var i = 0; i < a.length; i++) { p = a[i].parentNode; while (p.tagName!="TBODY") p = p.parentNode; k[a[i].textContent] = p.id }; p = document.createElement("pre"); document.body.appendChild(p); p.textContent = JSON.stringify(k)'

# FWT test suite

FWT_PATH=$(HOME)/src/fwt

bench/fwt.rkt: get_bench.py get_bench.js $(wildcard $(FWT_PATH)/*/*/)
# Note that the "2-with-javascript" bit handles a special case for the childrensappwebsitetemplate
	xvfb-run -a -s '-screen 0 1920x1080x24' \
	    python2 get_bench.py --name fwt \
	        $(shell find $(wildcard $(FWT_PATH)/*/*) \
	              -name 'index.html' -not -path '*2-with-javascript*' )

reports/minimized.html reports/minimized/: reports/fwt.json
	mkdir -p reports/minimized
	xvfb-run -a -s '-screen 0 1920x1080x24' <reports/fwt.json python2 minimize-all.py

bench/fwt.working.rkt bench/fwt.broken.rkt: bench/fwt.rkt reports/fwt.json
	<bench/fwt.rkt racket infra/filter-working.rkt reports/fwt.json bench/fwt.working.rkt bench/fwt.broken.rkt

# Debugging aid
/tmp/%/: $(FWT_PATH)/%.zip
	unzip -q $< -d /tmp/

reports/fwt.html reports/fwt.json: bench/fwt.rkt
	racket src/report.rkt regression $(FLAGS) --show-all --timeout 900 -o reports/fwt $^

reports/vizassert.html reports/vizassert.json: bench/fwt.working.rkt
	racket src/report.rkt assertions $(FLAGS) --expected bench/fwt/expected.sexp --show-all --timeout 1800 -o reports/vizassert bench/assertions/assertions.vizassert bench/fwt.working.rkt

reports/specific.html reports/specific.json: bench/fwt.rkt bench/assertions/specific.sexp
	racket src/report.rkt specific-assertions $(FLAGS) --expected bench/fwt/expected.sexp --show-all --timeout 1800 -o reports/specific bench/assertions/specific.vizassert bench/fwt.rkt bench/assertions/specific.sexp

reports/modular.html reports/modular.json: bench/modular-yoga.rkt
	racket src/report.rkt merify $(FLAGS) --show-all --timeout 600 -o reports/modular $^
