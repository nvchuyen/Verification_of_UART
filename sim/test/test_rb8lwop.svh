// ----------------------------------
// 08/31/2023
// Nguyen Van Chuyen
//
// ----------------------------------


class test_rb8lwop extends base_test /* base class*/;
	`uvm_component_utils(test_rb8lwop)

	function new(input string inst = "test", uvm_component c);
		super.new(inst, c);		
	endfunction 

	rand_baud_len8 rb8lwop;

	virtual function void build_phase( uvm_phase phase);
		super.build_phase(phase);
		rb8lwop = rand_baud_len8::type_id::create("rb8lwop");
	endfunction 


	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		rb8lwop.start(e.a.seqr);		
		#20;
		phase.drop_objection(this);
	endtask : run_phase

endclass : test_rb8lwop