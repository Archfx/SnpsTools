# Tutorial for Synopsys tool chain

Log in to the server, clone this repo, Enjoy!

## Load the necessary modules

``` shell
module load snp
module load vcs
or 
source /apps/settings
```


## VCS simulation

Compile the verilog design and run

``` shell
cd VCS
vcs counter.v tb.v
./simv 
```


## Compile the design with Design Compiler

```shell
cd DC_shell
dc_shell -no_gui -f synth.tcl
```
