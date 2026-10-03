module SCCS_FSM ( 
    input  START , TOGGLE, 
    input   E,G,L, 
    input  CLK, RESET, 
 output  [2:0] alu_opcode, 
  output  [1:0] wrt_addr, rd_addr1, rd_addr2, 
  output  wrt_en, load_data, 
  output input_sel,DONE 
    
); 
 
wire [2:0] opcode; 

wire [1:0] operand1, operand2; 
  
 FSM U0 ( 
     .START(START), .TOGGLE(TOGGLE), 
    .E(E),.G(G),.L(L),  
   . CLK(CLK), .RESET(RESET), 
    . opcode(opcode), 
    .operand1(operand1), .operand2(operand2), 
    .DONE(DONE) 
); 
  
 fsmdecode U1 ( 
  . opcode(opcode), 
    .operand1(operand1), .operand2(operand2), 
   .alu_opcode(alu_opcode), 
  . wrt_addr(wrt_addr), .rd_addr1(rd_addr1), .rd_addr2(rd_addr2), 
  .wrt_en(wrt_en), .load_data(load_data), .input_sel(input_sel) 
); 
endmodule
