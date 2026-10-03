module tb_four_reg(); 
 
    reg clk; 
    reg [3:0] D1, D2, D3, D4; 
    wire [3:0] Q1, Q2, Q3, Q4; 
 
   
    four_reg dut( 
        .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), 
        .D1(D1), .D2(D2), .D3(D3), .D4(D4), 
        .clk(clk) 
    ); 
 
   
    always begin 
        #5 clk = ~clk;  
    end 
 
    // Stimulus 
    initial begin 
        clk = 0; 
        D1 = 4'b1000; D2 = 4'b0001; D3 = 4'b0010; D4 = 4'b1101;  
        #10;  
        D1 = 4'b0100; D2 = 4'b0101; D3 = 4'b0110; D4 = 4'b1100;  
        #10;  
        $stop;  
    end 
 
   
 
endmodule
