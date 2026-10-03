module mux_2_to_1_4bit ( 
    output reg [3:0] F , 
    input wire [3:0] in1, 
    input wire [3:0] Q, 
    input wire S 
); 
 
always @(S or in1 or Q) begin 
    case (S) 
        1'b0: F = Q; 
        1'b1: F = in1; 
        default: F = 4'b0000;  
    endcase 
end 
 
endmodule
