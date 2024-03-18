//////////////////////////////////////////////////////////////////////////////////
// Company: ALPHA SEMICONDUCTORS LLP
// Engineer: <Mrinal Kanti Debnath>
//
// Create Date:    11:00 PM 2/03/2024 
// Design Name:   <alu16.sv>
// Module Name:    alu_generator
// Project Name:    MIPSCORE16
// Target Devices:  <To be left blank for now>
// Tool versions:     <To be left blank for now>
// Description:  <Sequence for Sanity>
// 
// Dependencies:
//
// Revision:
// Revision 0.01 
// Additional Comments: No bugs found in Design. 
// 

//////////////////////////////////////////////////////////////////////////////////

class alu_generator extends uvm_sequence#(alu_transaction);
  `uvm_object_utils(alu_generator)
  
    int i=0;
    alu_transaction alu_tr;
    int arithmetic [$]='{0,1,7};
    int logical [$]='{4,5,6};
    int counter [$]='{3,4};
 
   function new(input string path = "generator");
    super.new(path);
   endfunction
   
   
   virtual task body(); 
     repeat(1)
     begin
       alu_tr =alu_transaction::type_id::create("alu_tr");
       repeat(arithmetic.size())
          begin
            start_item(alu_tr);
            alu_tr.a=100;alu_tr.b=20;alu_tr.op=arithmetic.pop_front();
            `uvm_info("SEQ", $sformatf("a : %0d  b : %0d op : %0d y : %0d", alu_tr.a, alu_tr.b,alu_tr.op,alu_tr.y), UVM_NONE);
            finish_item(alu_tr);
         end
       repeat(logical.size())
          begin
            start_item(alu_tr);
            alu_tr.a=100;alu_tr.b=20;alu_tr.op=logical.pop_front();
            `uvm_info("SEQ", $sformatf("a : %0d  b : %0d op : %0d y : %0d", alu_tr.a, alu_tr.b,alu_tr.op, alu_tr.y), UVM_NONE);
            finish_item(alu_tr);
         end
       repeat(counter.size())
          begin
            start_item(alu_tr);
            alu_tr.a=100;alu_tr.b=20;alu_tr.op=counter.pop_front();
            `uvm_info("SEQ", $sformatf("a : %0d  b : %0d op : %0d y : %0d", alu_tr.a, alu_tr.b,alu_tr.op, alu_tr.y), UVM_NONE);
            finish_item(alu_tr);
         end
     end
   endtask
 
endclass
