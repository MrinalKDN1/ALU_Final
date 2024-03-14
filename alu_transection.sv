class alu_transaction extends uvm_sequence_item;
`uvm_object_utils(alu_transaction)
  
  rand bit [15:0] a;
  rand bit [15:0] b;
  rand bit [2:0] op;
  bit [15:0] y;
        
   function new(input string path = "alu_transaction");
    super.new(path);
   endfunction
  
 
endclass

