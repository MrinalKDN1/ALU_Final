//////////////////////////////////////////////////////////////////////////////////
// Company: ALPHA SEMICONDUCTORS LLP
// Engineer: <Mrinal Kanti Debnath>
//
// Create Date:    12:15 PM 18/03/2024 
// Design Name:   <alu16design.sv>
// Module Name:    TB for ALU COverage
// Project Name:    MIPSCORE16
// Target Devices:  <To be left blank for now>
// Tool versions:     <To be left blank for now>
// Description:  <Check Correctness of Basic ALU Functionality>
// 
// Dependencies:
//
// Revision:
// Revision 0.01 
// Additional Comments:Used Standard Nomenclature for referance
// 

//////////////////////////////////////////////////////////////////////////////////





`include "uvm_macros.svh"
import uvm_pkg::*;
`include"alu_test.sv"
`include"alu_interface.sv"
`include"alu16design.sv"

module tb;
 
  alu16_if vif();
  
  alu16 dut (.a(vif.a), .b(vif.b),.op(vif.op),.y(vif.y));
 
  initial 
  begin
    uvm_config_db #(virtual alu16_if)::set(null, "*", "vif", vif);
  run_test("alu_test"); 
  end


  covergroup cg_group;
    
    option.per_instance=1;
    option.auto_bin_max=10;
    option.name="Cover_a_b_op";
    
    A: coverpoint vif.a;
    B: coverpoint vif.b;					
    OP : coverpoint vif.op;
    Y:coverpoint vif.y;
    
 endgroup
  
   covergroup cg_group1;
    
    option.per_instance=1;
    option.auto_bin_max=4;
    option.name="Cross_a_b_op";
    
    A: coverpoint vif.a;
    B: coverpoint vif.b;					
    OP : coverpoint vif.op;
    Y:coverpoint vif.y;
    
    ab: cross A,B;
    cop: cross ab,OP;
 endgroup
     
  cg_group ci=new();
  cg_group1 c2=new();
  
 initial
    begin    
      repeat(500)
      begin
        vif.a=$urandom;
        vif.b=$urandom;
        vif.op=$urandom;
  		  ci.sample();
          c2.sample();
  		  #1;
  		end
    end
  
  
  initial 
    begin 
      #1000;
      $stop();
    end

 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule



