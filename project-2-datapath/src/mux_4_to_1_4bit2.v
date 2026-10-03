module mux_4_to_1_4bit2 ( 
    output reg [3:0] F , 
    input wire [3:0] ST, 
    input wire [3:0] UT, 
    input wire [3:0] SH, 
    input wire [3:0] UH, 
    input wire [1:0] S 
); 
 
always @(S or ST or  UT or SH or UH) begin 
    case (S) 
        2'b00: F = UH;  
        2'b01: F = SH; 
        2'b10: F = UT; 
        2'b11: F = ST; 
        default: F = 4'b0000; 
    endcase 
end 
 
endmodule
