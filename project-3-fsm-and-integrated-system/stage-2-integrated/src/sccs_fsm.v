module SCCS_FSM ( 
    input START , TOGGLE, 

    input [3:0] Sensor, user, 
    input CLK, RESET, 
    output E, G, L, 
    output DONE, 
    output [3:0] result 
); 
 
wire [3:0] OUTDECODER; 
wire [3:0] outputand; 
wire [2:0] alu_opcode; 
wire [1:0] wrt_addr, rd_addr1, rd_addr2; 
wire wrt_en, load_data; 
wire [2:0] opcode; 
wire [1:0] operand1, operand2; 
wire [3:0] Loadmux; 
wire [3:0] Loadmux2; 
wire [3:0] mux2andoutput; 
wire [3:0] mux2andoutput1; 
wire [3:0] mux2andoutput2; 
wire [3:0] mux2andoutput3; 
wire [3:0] Q1; 
wire [3:0] Q2; 
wire [3:0] Q3; 
wire [3:0] Q4; 
wire [3:0] Q5; 
wire [3:0] RXX; 
wire [3:0] RYY; 
wire TOGGLEN; 
wire input_sel; 
 
FSM U0 ( 
    .START(START), .TOGGLE(TOGGLE), 
    .E(E), .G(G), .L(L), 
    .CLK(CLK), .RESET(RESET), 
    .opcode(opcode), 
    .operand1(operand1), .operand2(operand2), 
    .DONE(DONE) 
); 
 
fsmdecode U1 ( 
    .opcode(opcode), 
    .operand1(operand1), .operand2(operand2), 
    .alu_opcode(alu_opcode), 
    .wrt_addr(wrt_addr), .rd_addr1(rd_addr1), .rd_addr2(rd_addr2), 
    .wrt_en(wrt_en), .load_data(load_data), .input_sel(input_sel) 
); 
 
decoder_2_to_4 U2 (.F(OUTDECODER), .wrt_addr(wrt_addr)); 
 
assign TOGGLEN = ~TOGGLE; 
 
and U3 (outputand[0], OUTDECODER[3], TOGGLEN, wrt_en); 
and U4 (outputand[1], OUTDECODER[2], TOGGLEN, wrt_en); 
and U5 (outputand[2], OUTDECODER[1], TOGGLE, wrt_en); 
and U6 (outputand[3], OUTDECODER[0], TOGGLE, wrt_en); 
 
mux_2_to_1_4bit U7 (.F(Loadmux), .in1(Sensor), .Q(user), .S(input_sel)); 
mux_2_to_1_4bit U8 (.F(Loadmux2), .in1(Loadmux), .Q(result), .S(load_data)); 
 
mux_2_to_1_4bit U9 (.F(mux2andoutput), .in1(Loadmux2), .Q(Q1), .S(outputand[0])); 
mux_2_to_1_4bit U10 (.F(mux2andoutput1), .in1(Loadmux2), .Q(Q2), .S(outputand[1])); 
mux_2_to_1_4bit U11 (.F(mux2andoutput2), .in1(Loadmux2), .Q(Q3), .S(outputand[2])); 
mux_2_to_1_4bit U12 (.F(mux2andoutput3), .in1(Loadmux2), .Q(Q4), .S(outputand[3])); 
 
four_reg U13 (.Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .D1(mux2andoutput), .D2(mux2andoutput1), 
.D3(mux2andoutput2), .D4(mux2andoutput3), .clk(CLK)); 
 
mux_4_to_1_4bit2 U14 (.F(RXX), .ST(Q1), .UT(Q2), .SH(Q3), .UH(Q4), .S(rd_addr1)); 
mux_4_to_1_4bit2 U15 (.F(RYY), .ST(Q1), .UT(Q2), .SH(Q3), .UH(Q4), .S(rd_addr2)); 
 
arithmetic_module U16 ( 
    .opr1(RXX), 
    .opr2(RYY), 
    .op(opcode), 
    .result(result), 
    .L(L), .E(E), .G(G) 
); 
 
d_ff4 U17 (.D(result), .clk(CLK), .Q(Q5)); 
 
endmodule
