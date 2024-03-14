module alu16(a,b,op,y);
  input [15:0] a,b;
  input [2:0] op;
  output reg [15:0]y;
  
  always@(*)
  begin
  case(op)
  3'b000:y=a+b;
  3'b001:y=a-b;
  3'b010:y=a+1;
  3'b011:y=a-1;
  3'b100:y=a&b;
  3'b101:y=a|b;
  3'b110:y=a^b;
  3'b111:y=a*b;
  default:y=0;  
  endcase 
  end
  endmodule

