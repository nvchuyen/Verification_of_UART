// --------------------------------
// 08/31/2023
// Nguyen Van Chuyen
//
// --------------------------------

class test_rb7lwop extends base_test /* base class*/;
	`uvm_component_utils(test_rb7lwop)

	function new(input string inst = "test", uvm_component c);
		super.new(inst, c);
	endfunction 

	rand_baud_len7 rb7lwop;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rb7lwop = rand_baud_len7::type_id::create("rb7lwop");
	endfunction 

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		rb7lwop.start(e.a.seqr);
		#20;
		phase.drop_objection(this);		
	endtask : run_phase

endclass : test_rb7lwop

