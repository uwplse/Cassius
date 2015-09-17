all:
	make clean && make CMF && make -f CoqMakefile && mv z3o.scm z3o.rkt && echo "#lang racket" >> z3o.rkt.tem && echo "(require \"macros_extr.rkt\")" >> z3o.rkt.tem && tail -n +4 "z3o.rkt" >> z3o.rkt.tem && rm z3o.rkt && mv z3o.rkt.tem z3o.rkt
clean: CMF
	make -f CoqMakefile clean && mv macros_extr.rkt macros_extr.rkt.backup && (rm *.rkt || : ) && mv macros_extr.rkt.backup macros_extr.rkt && rm CoqMakefile && (rm *~ || : )
CMF: 
	coq_makefile -f _CoqProject

