
class alu_env extends uvm_env;
`uvm_component_utils(alu_env)
 
function new(input string inst = "alu_env", uvm_component c);
super.new(inst,c);
endfunction
 
alu_agent a;
alu_sco s;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a =alu_agent::type_id::create("a",this);
  s =alu_sco::type_id::create("s", this);
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
a.m.send.connect(s.recv);
endfunction
 
endclass

