// ----------------------------------------
// Nguyen Van Chuyen
// 08/30/2023
// ----------------------------------------
class test_rb5lwop extends base_test  /* base class*/;
	`uvm_component_utils(test_rb5lwop)

	function new( input string inst = "test", uvm_component c);
		super.new(inst, c);
	endfunction 

	rand_baud_len5 rb5lwop;

	virtual function void build_phase( uvm_phase phase);
		super.build_phase(phase);
		rb5lwop = rand_baud_len5::type_id::create("rb5lwop");
	endfunction 

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(phase);
		rb5lwop.start(e.a.seqr);
		phase.drop_objection(phase);
	endtask : run_phase
 
endclass : test_rb5lwop