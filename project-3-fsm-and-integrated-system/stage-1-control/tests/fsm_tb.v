module FSM_tb; 
 
 
reg START; 
reg TOGGLE; 
reg E,G,L; 
reg CLK; 
reg RESET; 
 
 
wire [2:0] opcode; 
wire [1:0] operand1; 
wire [1:0] operand2; 
wire DONE; 
 
 
FSM uut ( 
    .START(START), 
    .TOGGLE(TOGGLE), 
    .L(L),.G(G), .E(E), 
    .CLK(CLK), 
    .RESET(RESET), 
    .opcode(opcode), 
    .operand1(operand1), 
    .operand2(operand2), 
    .DONE(DONE) 
); 
 
 
initial begin 
    CLK = 0; 
    forever #5 CLK = ~CLK;  
end 
 
 
initial begin 
     
    START = 1; 
    TOGGLE = 0; 
    E = 1'b0; 
    G = 1'b1; 
    L = 1'b0; 
    RESET = 0; 
     #100; 
     
    RESET = 1; 
    #10; 
    RESET = 0; 
 
     
    #10; 
    START = 1; 
    
      E = 1'b0; 
    G = 1'b1; 
    L = 1'b0; 
     #100; 
    RESET = 1; 
    #10; 
    RESET = 0; 
 
     
   
     #10; 
    START = 1; 
    
      E = 1'b0; 
    G = 1'b0; 
    L = 1'b1; 
      #100; 
    RESET = 1; 
    #10; 
    RESET = 0; 
     #10; 
    START = 1; 
    
      E = 1'b1; 
    G = 1'b0; 
    L = 1'b0; 
     
     
    #100; 
    $stop; 
end 
 
endmodule
