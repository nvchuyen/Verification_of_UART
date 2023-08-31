
TESTCASE=FIRST_TEST
# TESTCASE=test_rb6l
# TESTCASE=test_rb7l
# TESTCASE=test_rb8l



export UVM_HOME=/11tools/MENTOR/questasim_10.7c/questasim/verilog_src/uvm-1.1d


if [[ $1 = "clean" ]]; then
	echo "clean code";
	rm -rf work;
	rm -rf transcript *.log *.wlf *.vcd *.bin
	echo "Complete";

elif [[ $1 = "build" ]]; then
	#statements
	vlib work;
	vlog -incr -timescale=1ns/1ns -sv -f filelist_tb.f  -l vlog_tb.log +acc=mnprt -assertdebug +define+$TESTCASE;
	vlog -sv -l vlog_rtl.log -f filelist_rtl.f -incr +acc=mnprt +cover=sbceft -assertdebug ;

else
	rm -rf work vsim.wlf;
	vlib work;
	vlog -incr -timescale=1ns/1ns -sv -f filelist_tb.f  -l vlog_tb.log +acc=mnprt -assertdebug +define+$TESTCASE;
	vlog -sv -l vlog_rtl.log -f filelist_rtl.f -incr +acc=mnprt +cover=sbceft -assertdebug ;
	# vopt -debug -designfile dff.bin  top_tb -o opt
	vsim -c -sv_seed 20 top_tb -l vsim.log -dpicpppath /usr/bin/gcc  +UVM_VERBOSITY=UVM_LOW +UVM_TESTNAME="$TESTCASE"  -assertdebug -coverage +voptargs=+acc  -do "set WildcardFilter None; add wave -position insertpoint sim:/uvm_pkg/*;
add wave -r top_tb/*; run -all; quit;"

fi




