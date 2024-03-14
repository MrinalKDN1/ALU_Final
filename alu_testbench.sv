//////////////////////////////////////////////////////////////////////////////////
// Company: ALPHA SEMICONDUCTORS LLP
// Engineer: <Mrinal Kanti Debnath>
//
// Create Date:    10:15 PM 4/03/2024 
// Design Name:   <alu16design.sv>
// Module Name:    Verification of ALU using UVM TB 
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
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule



