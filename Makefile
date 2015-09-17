TEST_FILES=$(wildcard bench/*.rkt)
TESTS=$(TEST_FILES:bench/%.rkt=%:verify)

.PHONY: download deploy

test:
	bash test.sh $(TESTS)

deploy:
	rsync -r www/ $(shell ~/uwplse/getdir)

download:
	grep ';; python get_bench.py' -R bench/ | cut '-d:' -f2- | cut -c4- | xargs -n1 bash -c
