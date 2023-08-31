
// --------------------------------
// Nguyen Van Chuyen
// 08/31/2023
//
// --------------------------------

class test_rb6lwop extends base_test /* base class*/;
	`uvm_component_utils(test_rb6lwop)

	function new(input string inst = "test", uvm_component c);
		super.new(inst, c);
	endfunction 

	rand_baud_len6 rb6lwop;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rb6lwop = rand_baud_len6::type_id::create("rb6lwop");
	endfunction 

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		rb6lwop.start(e.a.seqr);
		phase.drop_objection(this);
	endtask : run_phase


endclass : test_rb6lwop
