// -------------------------------------
// Nguyen Van Chuyen
// 08/30/2023
//
// -------------------------------------

class test_rb7l extends  base_test /* base class*/;
	`uvm_component_utils(test_rb7l)

	function new(input string inst = "test", uvm_component  c);
		super.new(inst, c);
	endfunction 

	rand_baud_len7p rb7l;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rb7l = rand_baud_len7p::type_id::create("rb7l"); 
	endfunction 

	virtual task run_phase( uvm_phase phase);
		phase.raise_objection(this);
		rb7l.start(e.a.seqr);
		phase.drop_objection(this);
	endtask : run_phase

endclass : test_rb7l






