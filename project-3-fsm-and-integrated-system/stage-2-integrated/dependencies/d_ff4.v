module d_ff4 (D, clk, Q); 
  input [3:0] D; 
  input clk; 
  output reg [3:0] Q; 
   
  initial begin 
    Q = 4'b0000; 
  end 
   
  always @(posedge clk) begin 
    Q <= D; 
  end 
endmodule
