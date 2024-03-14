
class alu_agent extends uvm_agent;
`uvm_component_utils(alu_agent)
 
function new(input string inst = "alu_agent", uvm_component parent = null);
super.new(inst,parent);
endfunction
 
 alu_drv d;
 uvm_sequencer#(alu_transaction) seqr;
 alu_mon m;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
 d = alu_drv::type_id::create("d",this);
 m = alu_mon::type_id::create("m",this);
 seqr = uvm_sequencer#(alu_transaction)::type_id::create("seqr", this);
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
d.seq_item_port.connect(seqr.seq_item_export);
endfunction
 
endclass

