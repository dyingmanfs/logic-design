module fsmdecode ( 
  input [2:0] opcode, 
  input [1:0] operand1, operand2, 
  output reg [2:0] alu_opcode, 
  output reg [1:0] wrt_addr, rd_addr1, rd_addr2, 
  output reg wrt_en, load_data, 
  output reg input_sel 
); 
 
  always @(opcode or operand1 or operand2) begin  
    case(opcode) 
      3'b000: begin  
        alu_opcode = 3'b000; 
        wrt_en = 0; 

        load_data = 0; 
        wrt_addr = 2'b00; 
        rd_addr1 = 2'b00; 
        rd_addr2 = 2'b00; 
      end 
 
      3'b001: begin  
        alu_opcode = 3'b001; 
        wrt_addr = operand1; 
        wrt_en = 1; 
        load_data = 0; 
        rd_addr1 = 2'b00; 
        rd_addr2 = 2'b00; 
      end 
 
      3'b010: begin  
        alu_opcode = 3'b010; 
        rd_addr1 = operand1; 
        wrt_addr = operand1; 
        wrt_en = 1; 
        load_data = 0; 
        rd_addr2 = 2'b00; 
      end 
 
      3'b011: begin  
        alu_opcode = 3'b011; 
        rd_addr1 = operand1; 
        wrt_addr = operand1; 
        wrt_en = 1; 
        load_data = 0; 
        rd_addr2 = 2'b00; 
      end 
 
      3'b100: begin  
        alu_opcode = 3'b100; 
        wrt_addr = operand1; 
        wrt_en = 1; 
        load_data = 1; 
        rd_addr1 = 2'b00; 
        rd_addr2 = 2'b00; 
       if(wrt_addr== 2'b00 || wrt_addr == 2'b10)begin  
           input_sel = 1'b1; 
       end  
        if(wrt_addr== 2'b11 || wrt_addr == 2'b01)begin  
           input_sel = 1'b0; 
       end  
        
      end 
 
      3'b101: begin  
        alu_opcode = 3'b101; 
        rd_addr1 = operand1; 
        wrt_en = 0; 
        load_data = 0; 
        wrt_addr = 2'b00; 
        rd_addr2 = 2'b00; 
      end 
 
      3'b110: begin  
        alu_opcode = 3'b110; 
        rd_addr1 = operand1; 
        rd_addr2 = operand2; 
        wrt_addr = operand1; 
        wrt_en = 1; 
        load_data = 0; 
      end 
 
      3'b111: begin  
        alu_opcode = 3'b111; 
        rd_addr1 = operand2; 
        wrt_addr = operand1; 
        wrt_en = 1; 
        load_data = 0; 
        rd_addr2 = 2'b00; 
      end 
    endcase 
  end 
endmodule
