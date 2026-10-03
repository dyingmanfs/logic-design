module SCCS_FSM_tb; 
 
  // Inputs 
  reg START; 
  reg TOGGLE; 
  reg E, G, L; 
  reg CLK; 
  reg RESET; 
 
  // Outputs 
  wire [2:0] alu_opcode; 
  wire [1:0] wrt_addr; 
  wire [1:0] rd_addr1; 
  wire [1:0] rd_addr2; 
  wire wrt_en; 
  wire load_data; 
  wire input_sel; 
  wire DONE; 
 
 
  SCCS_FSM uut ( 
    .START(START), 
    .TOGGLE(TOGGLE), 
    .E(E), .G(G), .L(L), 
    .CLK(CLK), 
    .RESET(RESET), 
    .alu_opcode(alu_opcode), 
    .wrt_addr(wrt_addr), 
    .rd_addr1(rd_addr1), 
    .rd_addr2(rd_addr2), 
    .wrt_en(wrt_en), 
    .load_data(load_data), 
    .input_sel(input_sel), 
    .DONE(DONE) 
  ); 
 
  
  initial begin 
    CLK = 0; 
    forever #5 CLK = ~CLK;  
  end 
 
  
  initial begin 
 
    RESET = 0; 
    START = 0; 
    TOGGLE = 0; 
    E = 0; 
    G = 0; 
    L = 0; 
    RESET = 0; 
 
  
    RESET = 1; 
    #10; 
    RESET = 0; 
 
     
    #10; 
    START = 1; 
    G = 1; 
    #100; 
    G = 0; 
    L = 1; 
    #100; 
     RESET = 1; 
    #10; 
    RESET = 0; 
 
    
    #10; 
    L = 0; 
    E = 1; 
    #100; 
 
     
    #100; 
    $stop; 
  end 
 
  
 
endmodule
