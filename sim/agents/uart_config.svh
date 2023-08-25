//------------------------------------------------
// Nguyen Van Chuyen
// 08/23/2023
//
//
//-------------------------------------------------
//
// Class Description
//
/////////////build the seq for random length with and without priority
 
////////////////////////////////////////////////////////////////////////////////////
class uart_config extends uvm_object; /////configuration of env
  `uvm_object_utils(uart_config)
  
  function new(string name = "uart_config");
    super.new(name);
  endfunction
  
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
endclass : uart_config
