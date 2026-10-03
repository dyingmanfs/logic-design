module SCCS_FSM_tb; 
 
  // Inputs 
  reg START; 
  reg TOGGLE; 
  reg [3:0] Sensor, user; 
  reg CLK; 
  reg RESET; 
 
  // Outputs 
  wire E, G, L; 
  wire DONE; 
  wire [3:0] result; 
 
 
  SCCS_FSM uut ( 
    .START(START), 
    .TOGGLE(TOGGLE), 
    .Sensor(Sensor), 
    .user(user), 
    .CLK(CLK), 
    .RESET(RESET), 
    .E(E), .G(G), .L(L), 
    .result(result), 
    .DONE(DONE) 
  ); 
 
   
  initial begin 
    CLK = 0; 
    forever #5 CLK = ~CLK;  
  end 
 
   
  initial begin 
  user = 4'b1010; 
  Sensor = 4'b1101; 
  TOGGLE  = 1'b0; 
  START = 1'b1; 
  RESET = 1'b1; 
  #10; 
   RESET = 1'b0; 
  TOGGLE  = 1'b1; 
  #100; 
   RESET = 1'b0; 
  TOGGLE  = 1'b1; 
  #100; 
   RESET = 1'b0; 
  TOGGLE  = 1'b0; 
  #100; 
   $stop; 
  end 
 
   
 
 
endmodule
