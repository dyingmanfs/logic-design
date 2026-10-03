module task2(); 
 
    reg [1:0] ABCD_TB; 
    wire [3:0] F_TB; 
 
    decoder_2_to_4 DUT (.F(F_TB), .wrt_addr(ABCD_TB)); 
 
    initial begin 
        #30; ABCD_TB = 2'b00; #1 $display("%b  | %b", ABCD_TB, F_TB); 
        #30; ABCD_TB = 2'b01; #1 $display("%b  | %b", ABCD_TB, F_TB); 
        #30; ABCD_TB = 2'b10; #1 $display("%b  | %b", ABCD_TB, F_TB); 
        #30; ABCD_TB = 2'b11; #1 $display("%b  | %b", ABCD_TB, F_TB); #100; 
    end 
 
endmodule
