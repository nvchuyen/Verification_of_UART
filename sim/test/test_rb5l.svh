
// -----------------------------------
// Nguyen Van Chuyen
// 08/30/2023
//
// -----------------------------------

class test_rb5l extends base_test /* base class*/;
	`uvm_component_utils(test_rb5l)

	function new (input string inst = "test", uvm_component c);
		super.new(inst, c);		
	endfunction 

	rand_baud_len5p rb5l;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rb5l = rand_baud_len5p::type_id::create("rb5l");
	endfunction 


	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		rb5l.start(e.a.seqr);
		#20ns;
		phase.drop_objection(this);
	endtask 

endclass : test_rb5l
