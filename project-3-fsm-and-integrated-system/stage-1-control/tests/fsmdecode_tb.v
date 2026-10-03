module fsmdecode_tb; 
 
  // Inputs 
  reg [2:0] opcode; 
  reg [1:0] operand1, operand2; 
   
 
  // Outputs 
  wire [2:0] alu_opcode; 
  wire [1:0] wrt_addr, rd_addr1, rd_addr2; 
  wire wrt_en, load_data; 
  wire input_sel; 
 
  // Instantiate the Unit Under Test (DUT) 
  fsmdecode dut ( 
    .opcode(opcode),  
    .operand1(operand1),  
    .operand2(operand2),  
    .alu_opcode(alu_opcode),  
    .wrt_addr(wrt_addr),  
    .wrt_en(wrt_en),  
    .load_data(load_data),  
    .rd_addr1(rd_addr1),  
    .rd_addr2(rd_addr2), 
    .input_sel(input_sel) 
  ); 
 
  initial begin 
     
 
     
    opcode = 3'b000; operand1 = 2'b10; operand2 = 2'b11; 
    #10; 
 
 
    opcode = 3'b001; operand1 = 2'b10; operand2 = 2'b11; 
    #10; 
 
    
    opcode = 3'b010; operand1 = 2'b10; operand2 = 2'b11; 
    #10; 
 
    
    opcode = 3'b011; operand1 = 2'b10; operand2 = 2'b11; 
    #10; 
 
     
    opcode = 3'b100; operand1 = 2'b10; operand2 = 2'b11; 
    #10; 
 
    
    opcode = 3'b101; operand1 = 2'b10; operand2 = 2'b11; 
    #10; 
 
    
    opcode = 3'b110; operand1 = 2'b11; operand2 = 2'b10; 
    #10; 
 
     
    opcode = 3'b111; operand1 = 2'b11; operand2 = 2'b10; 
    #10; 
 
     
    $stop; 
  end 
 
  
 
endmodule
