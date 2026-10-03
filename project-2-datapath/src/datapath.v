module datapath(input wire [1:0] wrt_addr, input wire Toggle, input wire wrt_en, input [3:0]  ST, 
input [3:0]  UT, input [3:0] SH, input [3:0]  UH, input [1:0] input_sel, input load_data,  input clk,input 
[1:0] rd_addr1,input [1:0] rd_addr2, input [2:0] op,  output L,output E,output G, output [3:0] result); 
   
   
   wire [3:0] OUTDECODER; 
   wire [3:0] outputand; 
   wire [3:0] outputmux41bit4; 
   wire [3:0] Loadmux; 
   wire [3:0] mux2andoutput;  
   wire [3:0] mux2andoutput1;  
   wire [3:0] mux2andoutput2;  
     
   wire   [3:0] Q1; 
   wire  [3:0] Q2; 
   wire  [3:0] Q3;  
    
    wire   [3:0] Q5;   
    
   wire [3:0] RYY; 
    wire [3:0] RXX; 
   wire [3:0] mux2andoutput3; 
    wire [3:0] Q4; 
    
    
    
   
  decoder_2_to_4 U0(.F(OUTDECODER), .wrt_addr(wrt_addr)); 
  assign Togglen = ~Toggle; 
  and U1(outputand[0],OUTDECODER[0], Togglen, wrt_en); 
  and U2(outputand[1],OUTDECODER[1], Togglen, wrt_en); 
  and U3(outputand[2],OUTDECODER[2], Toggle, wrt_en); 
  and U4(outputand[3],OUTDECODER[3], Toggle, wrt_en); 
   
  mux_4_to_1_4bit2 U5( .F(outputmux41bit4), .ST(ST), .UT(UT), .SH(SH), .UH(UH), .S(input_sel)); 
  mux_2_to_1_4bit U6(.F(Loadmux), .in1(outputmux41bit4), 
     .Q(result), 
    .S(load_data)); 
  mux_2_to_1_4bit U7(.F(mux2andoutput), .in1(Loadmux), .Q(Q1), .S(outputand[0])); 
   
  mux_2_to_1_4bit U8(.F(mux2andoutput1), .in1(Loadmux), .Q(Q2), .S(outputand[1])); 
   
  mux_2_to_1_4bit U9(.F(mux2andoutput2), .in1(Loadmux), .Q(Q3), .S(outputand[2])); 
   
  mux_2_to_1_4bit U10(.F(mux2andoutput3), .in1(Loadmux), .Q(Q4), .S(outputand[3])); 
  four_reg U11( .Q1(Q1), .Q2 (Q2), .Q3(Q3),  .Q4(Q4), .D1(mux2andoutput), .D2(mux2andoutput1), 
.D3 (mux2andoutput2), .D4(mux2andoutput3), .clk(clk)); 
  mux_4_to_1_4bit2 U12 (.F(RXX), .ST(Q1), .UT(Q2), .SH(Q3), .UH(Q4), .S(rd_addr1)); 
  mux_4_to_1_4bit2 U13 (.F(RYY), .ST(Q1), .UT(Q2), .SH(Q3), .UH(Q4), .S(rd_addr2)); 
   
   
   
  arithmetic_module U15 ( 
    .opr1(RXX), 
    .opr2(RYY), 
    .op(op), 
    .result(result),  
    .L(L), .E(E), .G(G) ); 
    d_ff4 U14 (.D(result), .clk(clk), .Q(Q5)); 
   
   
 
endmodule
