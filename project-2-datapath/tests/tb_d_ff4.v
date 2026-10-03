module tb_d_ff4; 
  reg [3:0] D; 
  reg clk; 
  wire [3:0] Q; 
 
  
  d_ff4 uut ( 
    .D(D), 
    .clk(clk), 
    .Q(Q) 
  ); 
 
  
  initial begin 
    clk = 0; 
    forever #5 clk = ~clk;  
  end 
 
 
  initial begin 
    
    D = 4'b0000; 
     
    
    #10 D = 4'b1010;  
    #10 D = 4'b1100;  
    #10 D = 4'b1111;  
    #10 D = 4'b0001;  
 
    
    #50 $finish; 
  end 
 
   
endmodule
