module tb_mux_4_to_1_4bit; 
    reg [3:0] ST, UT, SH, UH; 
    reg [1:0] S; 
    wire [3:0] F; 
 
    mux_4_to_1_4bit2 uut ( 
        .F(F), 
        .ST(ST), 
        .UT(UT), 
        .SH(SH), 
        .UH(UH), 
        .S(S) 
    ); 
 
    initial begin 
         
        ST = 4'b0001; 
        UT = 4'b0010; 
        SH = 4'b0100; 
        UH = 4'b1000; 
 
       
 
       
        S = 2'b00; #10;  
      
 
        S = 2'b01; #10; 
       
 
        S = 2'b10; #10; 
       
 
        S = 2'b11; #10;  
    
        $stop; 
    end 
endmodule
