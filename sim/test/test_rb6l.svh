// -----------------------------------------
// Nguyen Van Chuyen
// 08/30/2023
//
// -----------------------------------------

class test_rb6l extends  base_test /* base class*/;
	`uvm_component_utils(test_rb6l)
	// `uvm_component_utils(base_test)

	function new(input string inst = "test", uvm_component c);
		super.new(inst, c);
	endfunction 

	rand_baud_with_stop rbs;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rbs = rand_baud_with_stop::type_id::create("rbs");
	endfunction 

	// -----------------------------
	//
	// -----------------------------
	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		rbs.start(e.a.seqr);
		#20;
		phase.drop_objection(this);
	endtask : run_phase

	//-----------------------------
	//
	//-----------------------------
  	function void end_of_elaboration_phase(uvm_phase phase);
    	super.end_of_elaboration_phase(phase);
    	$display("--------------------------------------------------------------",);
    	$display("--------------------------------------------------------------",);
    	`uvm_info("TEST_RB6L","start of Elaboration Phase Executed", UVM_NONE);
    	uvm_top.print_topology();
    	`uvm_info("TEST_RB6L","End of Elaboration Phase Executed", UVM_NONE);
  	endfunction

endclass : test_rb6l