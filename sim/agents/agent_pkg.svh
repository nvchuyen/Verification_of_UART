

`ifndef AGENT_PKG_SV
`define AGENT_PKG_SV

package agent_pkg;
	
import uvm_pkg::*;
`include "uvm_macros.svh"

// `include "mul_if.sv"
`include "transaction.svh"
`include "driver.svh"
`include "monitor.svh"
`include "uart_config.svh"
// `include "uart_if.sv"

endpackage : agent_pkg

`endif


