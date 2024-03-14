
class alu_drv extends uvm_driver#(alu_transaction);
  `uvm_component_utils(alu_drv)
 
  alu_transaction alu_tr;
  virtual alu16_if vif;
 
  function new(input string path = "alu_drv", uvm_component parent = null);
    super.new(path,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    if(!uvm_config_db#(virtual alu16_if)::get(this,"","vif",vif))
      `uvm_error("drv","Unable to access Interface");
  endfunction
  
   virtual task run_phase(uvm_phase phase);
      alu_tr = alu_transaction::type_id::create("alu_tr");
     forever begin
        seq_item_port.get_next_item(alu_tr);
        vif.a <= alu_tr.a;
        vif.b <= alu_tr.b;
        vif.op<=alu_tr.op;
       `uvm_info("DRV", $sformatf("a : %0d  b : %0d op:%0d y : %0d", alu_tr.a,alu_tr.b,alu_tr.op,alu_tr.y), UVM_NONE);
        seq_item_port.item_done();
        #20;   
      end
   endtask
 
endclass

