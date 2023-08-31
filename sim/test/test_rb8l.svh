// -----------------------------------
// Nguyen Van Chuyen 
// 08/30/2023
//
// -----------------------------------

class test_rb8l extends base_test /* base class*/;
	`uvm_component_utils(test_rb8l)

	function new( input string name = "test", uvm_component c);
		super.new(name, c);
	endfunction 

	rand_baud_len8p rb8l;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rb8l = rand_baud_len8p::type_id::create("rb8l");
	endfunction 


	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		rb8l.start(e.a.seqr);
		#20;
		phase.drop_objection(this);
	endtask 

endclass : test_rb8l