module tb_datapath; 
 
  reg [1:0] wrt_addr; 
  reg Toggle; 
  reg wrt_en; 
  reg [3:0] ST; 
  reg [3:0] UT; 
  reg [3:0] SH; 
  reg [3:0] UH; 
  reg [1:0] input_sel; 
  reg load_data; 
  reg clk; 
  reg [1:0] rd_addr1; 
  reg [1:0] rd_addr2; 
  reg [2:0] op; 
  wire [3:0] result; 
  wire L; 
  wire E; 
  wire G; 
   
  datapath uut ( 
    .wrt_addr(wrt_addr), 
    .Toggle(Toggle), 
    .wrt_en(wrt_en), 
    .ST(ST), 
    .UT(UT), 
    .SH(SH), 
    .UH(UH), 
    .input_sel(input_sel), 
    .load_data(load_data), 
    .clk(clk), 
    .rd_addr1(rd_addr1), 
    .rd_addr2(rd_addr2), 
    .op(op), 
    .result(result), 
    .L(L),  
    .E(E), 
    .G(G) 
  ); 
 
  always begin 
    #5 clk = ~clk;  
  end 
 
  initial begin 
     
    input_sel = 2'b00; 
    clk = 1'b0; 
    wrt_en = 1'b0; 
    Toggle = 1'b0; 
    load_data = 1'b0; 
    wrt_addr = 2'b00; 
    ST = 4'b0000; 
    UT = 4'b0000; 
    SH = 4'b0000; 
    UH = 4'b0000; 
    rd_addr1 = 2'b10; 
    rd_addr2 = 2'b11; 
    op = 3'b100; 
 
     
    #10; 
    wrt_en = 1'b1; 
    Toggle = 1'b0;  
    wrt_addr = 2'b01; 
    SH = 4'b0111;  
    input_sel = 2'b01; 
    load_data = 1'b1; 
 
    #10; 
    wrt_addr = 2'b00;  
    UH = 4'b1010;  
    input_sel = 2'b00; 
    load_data = 1'b1; 
 
    #10; 
    op = 1'b100; 
    load_data = 1'b0; 
 
     
    #10; 
    op = 3'b011; 
    op = 3'b010; 
    op = 3'b010; 
     op = 3'b010; 
      op = 3'b110; 
 
 
    #100; 
    $stop;  
  end 
 
endmodule
