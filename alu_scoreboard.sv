
class alu_sco extends uvm_scoreboard;
`uvm_component_utils(alu_sco)
 
  uvm_analysis_imp#(alu_transaction,alu_sco) recv;
 
 
    function new(input string inst = "alu_sco", uvm_component parent = null);
    super.new(inst,parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("recv", this);
    endfunction
    
    
 virtual function void write(alu_transaction tr);
begin
 logic [15:0] received;
 logic [15:0] actual;

 case(tr.op)
  3'b000:received=tr.a+tr.b;
  3'b001:received=tr.a-tr.b;
  3'b010:received=tr.a+1;
  3'b011:received=tr.a-1;
  3'b100:received=tr.a&tr.b;
  3'b101:received=tr.a|tr.b;
  3'b110:received=tr.a^tr.b;
  3'b111:received=tr.a*tr.b;
  default:received=0;  
 endcase
 
  
  actual=tr.y;



  if(actual == received)
         `uvm_info("SCO", $sformatf("Test Passed -> a : %0d  b : %0d op : %0d y : %0d", tr.a, tr.b, tr.op, tr.y), UVM_NONE)
      else
         `uvm_error("SCO", $sformatf("Test Failed -> a : %0d  b : %0d op : %0d y : %0d", tr.a, tr.b,tr.op, tr.y))
      
    $display("------------");

end
    endfunction

endclass

