
class alu_mon extends uvm_monitor;
`uvm_component_utils(alu_mon)
 
uvm_analysis_port#(alu_transaction) send;
alu_transaction alu_tr;
virtual alu16_if vif;
 
    function new(input string inst = "alu_mon", uvm_component parent = null);
    super.new(inst,parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    alu_tr =alu_transaction::type_id::create("alu_tr");
    send = new("send", this);
      if(!uvm_config_db#(virtual alu16_if)::get(this,"","vif",vif))
      `uvm_error("drv","Unable to access Interface");
    endfunction
    
    
    virtual task run_phase(uvm_phase phase);
    forever begin
    #20;
    alu_tr.a = vif.a;
    alu_tr.b = vif.b;
    alu_tr.op=vif.op;
    alu_tr.y = vif.y;
      `uvm_info("MON", $sformatf("a : %0d  b : %0d op:%0d y : %0d",alu_tr.a,alu_tr.b,alu_tr.op,alu_tr.y), UVM_NONE);
    send.write(alu_tr);
    end
   endtask 
 
endclass

