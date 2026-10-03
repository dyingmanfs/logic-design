module four_reg( 
    output  wire [3:0] Q1,  
    output  wire [3:0] Q2,  

    output  wire [3:0] Q3,  
    output  wire [3:0] Q4, 
    input  [3:0] D1,  
    input [3:0] D2,  
    input [3:0] D3,  
    input [3:0] D4,  
    input clk 
); 
 
   
  d_ff4 U1 (D1, clk, Q1); 
  d_ff4 U2 (D2, clk, Q2); 
  d_ff4 U3 (D3, clk, Q3); 
  d_ff4 U4 (D4, clk, Q4); 
 
  
 
endmodule
