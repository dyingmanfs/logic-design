module arithmetic_module( 
    input [3:0] opr1, 
    input [3:0] opr2, 
    input [2:0] op, 
    output reg [3:0] result,  

    output reg L, E, G 
); 
 
always @(op or opr2 or opr1 ) begin 
    
    result = 4'b0000; 
    L = 0; 
    E = 0; 
    G = 0; 
 
    case(op) 
        3'b000: result = 4'b0000;  
        3'b001: result = 4'b0001;  
        3'b010: result = opr1 + 4'b0001;  
        3'b011: result = opr1 - 4'b0001;  
        3'b100: result = opr1;  
        3'b101: result = opr1;  
        3'b110: begin 
           
            if (opr1 > opr2) begin 
                G = 1; 
                E = 0; 
                L = 0; 
            end else if (opr1 < opr2) begin 
                G = 0; 
                E = 0; 
                L = 1; 
            end else begin 
                G = 0; 
                E = 1; 
                L = 0; 
            end 
        end 
        3'b111: result = opr2;  
         
        default: result = 4'b0000;  
    endcase 
end 
 
endmodule
