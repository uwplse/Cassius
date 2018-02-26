FLAGS=

test:
	raco test src

README.html: README.md aec/header.html
	pandoc -H aec/header.html --toc README.md -o README.html

# CSSWG test suite

CSSWG_PATH=$(HOME)/src/web-platform-tests/css/CSS2

bench/css/%.rkt: get_bench.py get_bench.js
	@ sh bench/css/get.sh $* $(patsubst %,file://%,$(wildcard $(CSSWG_PATH)/$*/*.xht))

reports/csswg.html reports/csswg.json: $(wildcard bench/css/*.rkt)
	racket src/report.rkt regression $(FLAGS) --index bench/css/index.json --expected bench/css/expected.sexp -o reports/csswg --sections s8.3,s8.3.1,s9.5,s9.5.1,s9.5.2,s10.8,s10.8.1 $^

reports/csswg-extra.html reports/csswg-extra.json: $(wildcard bench/css/*.rkt)
	racket src/report.rkt regression $(FLAGS) --index bench/css/index.json --expected bench/css/expected.sexp -o reports/csswg-extra $^

# FWT test suite

FWT_PATH=$(HOME)/src/fwt

bench/fwt.rkt: get_bench.py get_bench.js $(wildcard $(FWT_PATH)/*.zip)
	sh bench/fwt/get-all.sh $(wildcard $(FWT_PATH)/*.zip)

bench/fwt.working.rkt: bench/fwt.rkt reports/fwt.json
	racket src/filter-working.rkt reports/fwt.json <bench/fwt.rkt >bench/fwt.working.rkt

# Debugging aid
/tmp/%/: bench/fwt/%.zip
	unzip -q $< -d /tmp/

reports/fwt.html reports/fwt.json: bench/fwt.rkt
	racket src/report.rkt regression $(FLAGS) --show-all --timeout 900 -o reports/fwt $^

reports/general.html reports/general.json reports/general.txt: bench/fwt.working.rkt
	racket src/report.rkt assertions $(FLAGS) --verbose --expected bench/fwt/expected.sexp --show-all --timeout 1800 -o reports/vizassert bench/assertions/general.vizassert bench/fwt.working.rkt 2>&1 | tee reports/general.log
	mv reports/general.log reports/general.txt

reports/specific.html reports/specific.json: bench/fwt.working.rkt bench/assertions/specific.sexp
	racket src/report.rkt specific-assertions $(FLAGS) --verbose --expected bench/fwt/expected.sexp --show-all --timeout 1800 -o reports/specific bench/assertions/specific.vizassert bench/fwt.rkt bench/assertions/specific.sexp

reports/runtime.tex: reports/general.json
	python3 aec/runtime.py --debug reports/general.json > reports/runtime.tex

reports/hists.tex: reports/general.txt
	python3 aec/hist.py --debug reports/general.txt > reports/hists.tex

reports/insts.tex: reports/general.txt
	python3 aec/insts.py --debug reports/general.txt > reports/insts.tex

reports/%.pdf: reports/%.tex
	cd reports && pdflatex $*.tex
