module tb_arithmetic_module; 
reg [3:0] op1; 
reg [3:0]  op2; 
reg [2:0] opcode; 
 wire[3:0] result; 
 wire E; 
 wire L; 
 wire G; 
 
 arithmetic_module DUT(.opr1(op1),.opr2(op2),.op(opcode),.L(L),.E(E),.G(G),.result(result)); 
 initial 
 begin  
opcode=3'b001; op1=4'b1101; op2=4'b0101; #100; 
opcode=3'b010; op1=4'b1101; op2=4'b0101; #100;  
opcode=3'b100; op1=4'b1101; op2=4'b0101; #100;  
opcode=3'b011; op1=4'b1101; op2=4'b0101; #100;  
opcode=3'b100; op1=4'b1101; op2=4'b0101; #100;  
opcode=3'b101; op1=4'b1101; op2=4'b0101; #100;  
opcode=3'b110; op1=4'b1101; op2=4'b0101; #100;  
opcode=3'b111; op1=4'b1101; op2=4'b0101; #100; 
end 
endmodule
