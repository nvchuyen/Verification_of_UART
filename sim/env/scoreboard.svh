//-------------------------------------------------------
// Nguyen Van Chuyen
// 08/22/2023
//
//-------------------------------------------------------
//
// Class Description
//

class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
 
  uvm_analysis_imp#(transaction,scoreboard) recv;
  bit [31:0] arr[32] = '{default:0};
  bit [31:0] addr    = 0;
  bit [31:0] data_rd = 0;
 
 
 
    function new(input string inst = "scoreboard", uvm_component parent = null);
    super.new(inst,parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("recv", this);
    endfunction
    
    
  virtual function void write(transaction tr);
    `uvm_info("SCOREBOARD", $sformatf("BAUD:%0d LEN:%0d PAR_T:%0d PAR_EN:%0d STOP:%0d TX_DATA:%0d RX_DATA:%0d", tr.baud, tr.length, tr.parity_type, tr.parity_en, tr.stop2, tr.tx_data, tr.rx_out), UVM_NONE);
    if(tr.rst == 1'b1)
      `uvm_info("SCOREBOARD", "System Reset", UVM_NONE)
    else if(tr.tx_data == tr.rx_out)
      `uvm_info("SCOREBOARD", "Test Passed", UVM_NONE)
    else
      `uvm_info("SCOREBOARD", "Test Failed", UVM_NONE)
    $display("----------------------------------------------------------------");
    endfunction
 
endclass
