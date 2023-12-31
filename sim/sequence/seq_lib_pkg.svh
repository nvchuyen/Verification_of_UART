
package seq_lib_pkg;
	
import uvm_pkg::*;
`include "uvm_macros.svh"

import env_pkg::*;
import agent_pkg::*;

`include "transaction.svh"
		
/************************************************************
 * 
 * 
 * **********************************************************/
///////////////////////////////////////////////////////////////////////
 // typedef enum bit [3:0]   {rand_baud_1_stop = 0, 
 //                           rand_length_1_stop = 1, 
 //                           length5wp = 2, 
 //                           length6wp = 3, 
 //                           length7wp = 4, length8wp = 5, 
 //                           length5wop = 6, length6wop = 7, 
 //                           length7wop = 8, length8wop = 9,
 //                           rand_baud_2_stop = 11, 
 //                           rand_length_2_stop = 12} oper_mode;

 
///////////////////random baud - fixed length = 8 - parity enable - parity type : random - single stop
//////////////////////////////////////////////////////////
class rand_baud extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud)
  
  transaction tr;
 
  function new(string name = "rand_baud");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = rand_baud_1_stop;
        tr.length = 8;
        tr.baud   = 9600;
        tr.rst       = 1'b0;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
endclass : rand_baud


////////////////////random baud - fixed length = 8 - parity enable - parity type : random - two stop
//////////////////////////////////////////////////////////
class rand_baud_with_stop extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_with_stop)
  
  transaction tr;
 
  function new(string name = "rand_baud_with_stop");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op        = rand_baud_2_stop;
        tr.rst       = 1'b0;
        tr.length    = 8;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b1;
        finish_item(tr);
      end
  endtask
endclass : rand_baud_with_stop
 

//////////////////////////////////////////////////////////
////////////////////fixed length = 5 - variable baud - with parity
class rand_baud_len5p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len5p)
  
  transaction tr;
 
  function new(string name = "rand_baud_len5p");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op        = length5wp;
        tr.rst       = 1'b0;
        tr.tx_data   = {3'b000, tr.tx_data[7:3]};
        tr.length    = 5;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
endclass : rand_baud_len5p
 
 
 
//////////////////////////////////////////////////////////
////////////////////fixed length = 6 - variable baud - with parity
class rand_baud_len6p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len6p)
  
  transaction tr;
 
  function new(string name = "rand_baud_len6p");
    super.new(name);
  endfunction
  
    virtual task body();
        repeat(5) begin
            tr = transaction::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize);
            tr.op        = length6wp;
            tr.rst       = 1'b0;
            tr.length    = 6;
            tr.tx_data   = {2'b00, tr.tx_data[7:2]};
            tr.tx_start  = 1'b1;
            tr.rx_start  = 1'b1;
            tr.parity_en = 1'b1;
            tr.stop2     = 1'b0;
            finish_item(tr);
        end
    endtask
endclass : rand_baud_len6p
 

//////////////////////////////////////////////////////////
////////////////////fixed length = 7 - variable baud - with parity
class rand_baud_len7p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len7p)
  
  transaction tr;
 
  function new(string name = "rand_baud_len7p");
    super.new(name);
  endfunction
  
    virtual task body();
        repeat(5) begin
            tr = transaction::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize);
            tr.op        = length7wp;
            tr.rst       = 1'b0;
            tr.length    = 7;
            tr.tx_data   = {1'b0, tr.tx_data[7:1]};
            tr.tx_start  = 1'b1;
            tr.rx_start  = 1'b1;
            tr.parity_en = 1'b1;
            tr.stop2     = 1'b0;
            finish_item(tr);
        end
    endtask
endclass : rand_baud_len7p

 
//////////////////////////////////////////////////////////
////////////////////fixed length = 8 - variable baud - with parity
class rand_baud_len8p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len8p)
  
  transaction tr;
 
  function new(string name = "rand_baud_len8p");
    super.new(name);
  endfunction
  
    virtual task body();
        repeat(5) begin
            tr = transaction::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize);
            tr.op        = length8wp;
            tr.rst       = 1'b0;
            tr.length    = 8;
            tr.tx_data   =  tr.tx_data[7:0];
            tr.tx_start  = 1'b1;
            tr.rx_start  = 1'b1;
            tr.parity_en = 1'b1;
            tr.stop2     = 1'b0;
            finish_item(tr);
        end
    endtask
endclass : rand_baud_len8p
 

//////////////////////////////////////////////////////////
////////////////////fixed length = 5 - variable baud - without parity
class rand_baud_len5 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len5)
  
  transaction tr;
 
  function new(string name = "rand_baud_len5");
    super.new(name);
  endfunction
  
    virtual task body();
        repeat(5) begin
            tr = transaction::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize);
            tr.op        = length5wop;
            tr.rst       = 1'b0;
            tr.length    = 5;
            tr.tx_data   = {3'b000, tr.tx_data[7:3]};
            tr.tx_start  = 1'b1;
            tr.rx_start  = 1'b1;
            tr.parity_en = 1'b0;
            tr.stop2     = 1'b0;
            finish_item(tr);
        end
    endtask
endclass : rand_baud_len5
 
 
//////////////////////////////////////////////////////////
////////////////////fixed length = 6- variable baud - without parity
class rand_baud_len6 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len6)
  
  transaction tr;
 
  function new(string name = "rand_baud_len6");
    super.new(name);
  endfunction
  
    virtual task body();
        repeat(5) begin
            tr = transaction::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize);
            tr.op        = length6wop;
            tr.rst       = 1'b0;
            tr.length    = 6;
            tr.tx_data   = {2'b00, tr.tx_data[7:2]};
            tr.tx_start  = 1'b1;
            tr.rx_start  = 1'b1;
            tr.parity_en = 1'b0;
            tr.stop2     = 1'b0;
            finish_item(tr);
          end
    endtask
endclass : rand_baud_len6
 

//////////////////////////////////////////////////////////
////////////////////fixed length = 7- variable baud - without parity
class rand_baud_len7 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len7)
  
  transaction tr;
 
  function new(string name = "rand_baud_len7");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op        = length7wop;
        tr.rst       = 1'b0;
        tr.length    = 7;
        tr.tx_data   = {1'b0, tr.tx_data[7:1]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
endclass : rand_baud_len7
 
 
//////////////////////////////////////////////////////////
////////////////////fixed length = 8 - variable baud - without parity
class rand_baud_len8 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len8)
  
  transaction tr;
 
  function new(string name = "rand_baud_len8");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(30)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op        = length8wop;
        tr.rst       = 1'b0;
        tr.length    = 8;
        tr.tx_data   =  tr.tx_data[7:0];
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
endclass : rand_baud_len8
 
endpackage : seq_lib_pkg

