`include"alu_package.sv"
class alu_test extends uvm_test;
`uvm_component_utils(alu_test)
 
function new(input string inst = "alu_test", uvm_component c);
super.new(inst,c);
endfunction
 
alu_env e;
alu_generator gen;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  e   =alu_env::type_id::create("e",this);
  gen = alu_generator::type_id::create("gen");
endfunction
 
virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
gen.start(e.a.seqr);
#20;
phase.drop_objection(this);
endtask
endclass

