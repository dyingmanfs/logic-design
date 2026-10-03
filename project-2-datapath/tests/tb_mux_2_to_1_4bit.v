module tb_mux_2_to_1_4bit; 
    reg [3:0] in1, Q; 
    reg  S; 
    wire [3:0] F; 
 
 
    mux_2_to_1_4bit uut ( 
        .F(F), 
        .in1(in1), 
        .Q(Q), 
        .S(S) 
    ); 
 
    initial begin 
     
        in1 = 4'b0001; 
        Q = 4'b0010; 
       
 
        
        S = 1'b0; #10;  
         
 
        S = 1'b1; #10; 
       
 
 
        
        $stop; 
    end 
endmodule
