Steps to installing and running our tool: 

First follow the Cassius README below to set up and install our version of Cassius: 

Installing Cassius (Can also be found here: https://github.com/uwplse/Cassius)
------------

You'll need to install Racket <http://racket-lang.org> and Z3
<https://github.com/Z3Prover/z3>. Once Racket and Z3 are set up, edit
the `z3.sh` script, to call your installation of Z3. (Make sure to
pass through all arguments.)


Running our Benchmarks 
-------------
Test out your Cassius installation by running, from the top-level directory,

    ./cassius accept bench/repair/benchmarks.rkt wrong-tag

This should churn for a few seconds and say, "Accepted".

We created a set of benchmarks to test out our document repair for various scenarios. They are: 

wrong-tag
all-wrong-tag
wrong-tag-2
nested-1
with-hole
cant-fix
bad-id-and-tag
bad-ids
remove-id
add-id
repair-one

They can be run with the following command : 

./cassius accept bench/repair/benchmarks.rkt <benchmark-name>

The example from our paper can be run using : 

./cassius accept bench/repair/books/book-simple.rkt book-simple

Any of the benchmarks under the bench/repair folder can be ran using the above command, and by looking for the problem name in the .rkt file (define-problem). 


