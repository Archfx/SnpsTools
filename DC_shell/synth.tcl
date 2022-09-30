########### Library set up #######################################
#set search_path [list /mnt/shared/arm/gf/12lpplus/sc9mcpp84_base_rvt_c14/r0p0/db]
set target_library [list Libraries/saed90nm_typ.db]
set link_library [list Libraries/saed90nm_typ.db]
##################################################################

########### Set up working directory  ########################### 

define_design_lib work -path ./work

#################################################################
########### Read Verilog by Autoread option  ####################

#"rsa_mont"

set rtl_path . #Set to current path	
analyze $rtl_path -autoread -recursive -format verilog -top up_counter

#################################################################

set top "up_counter"
elaborate -lib work $top
current_design $top

link

set clock_name_1 [get_attribute [get_ports -nocase clk] full_name]
create_clock -name $clock_name_1 -period 10 -waveform [list 0 5] [get_port $clock_name_1]

########### For Flatten Netlist ###########################

#  set_flatten true  
#  uniquify -force
# ungroup -all -flatten 

###########################################################

compile


########### For Scan Chain insertion ###########################

# compile -scan
# write_test_protocol -output "s38584_netlist.spf"

#################################################################

########### Save Files Commands  ##########################
file mkdir netlist

set design_name up_counter

write -format verilog -hierarchy -output "netlist/${design_name}_netlist.v"
write_sdf -version 1.0 "netlist/${design_name}_netlist.sdf"
write_sdc "netlist/${design_name}_netlist.sdc"

#################################################################

########### Reports Commands  ##########################
file mkdir reports
report_area -hierarchy > "reports/${design_name}_report_area.out"
report_reference > "reports/${design_name}_report_ref.out"
report_power > "reports/${design_name}_report_power.out"
report_timing > "reports/${design_name}_report_timing.out"

#################################################################
