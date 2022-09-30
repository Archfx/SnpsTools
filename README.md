# Tutorial for Snps tool chain

Log in to the server, clone this repo, Enjoy!

## VCS simulation

Compile the verilog design and run
``
cd VCS
vcs counter.v tb.v
./simv``


## Compile the Design with design compiler

``
cd DC-shell
dc_shell -no_gui -f synth.tcl
``