module FSM ( 
    input wire START , TOGGLE, 
    input reg  E,G,L,  
    input wire CLK, RESET , 
    output reg [2:0] opcode, 
    output reg [1:0] operand1, operand2, 
    output reg DONE 
); 
 
 
parameter   
    IDLE = 1,  
    STATE1 = 2, 
    STATE2 = 3, 
    STATE3 = 4, 
    STATE4 = 5, 
    STATE5 = 6, 
    DONE_STATE = 7; 
 
reg [2:0]current_state, next_state; 
 
 
always @(posedge CLK or posedge RESET) begin 
    if (RESET) begin 
      $display("State0"); 
        current_state <= IDLE; 
      end 
    else begin 
      $display("State next"); 
        current_state <= next_state; 
      end 
end 
 
 
always @(posedge CLK or posedge RESET or next_state or E or G or L) begin 
     
     
 
    case (current_state) 
        IDLE: begin 
          $display("State0"); 
            if (START & CLK & !RESET) begin 
                next_state = STATE1; 
                
            end 
          else  
            next_state = IDLE; 
        end 
        STATE1: begin 
            
          $display("State1"); 
             if (START & CLK & !RESET) begin 
                next_state = STATE2; 
                 
            end 
          else if (!CLK & !RESET) 
             next_state = STATE1 ; 
          else  
            next_state = IDLE;  
             
        end 
        STATE2: begin 
            $display("State2"); 
             if (START & CLK & !RESET) begin 
                next_state = STATE3; 
                $display("Transitioning to STATE3"); 
                
            end 
             else if (!CLK & !RESET) begin 
             next_state = STATE2;  
             $display("Transitioning to STATE2"); 
           end 
            else begin 
              $display("Transitioning to STATE0"); 
            next_state = IDLE; end 
            
        end 
        STATE3: begin 
          $display("State3"); 
             
            if (START & G == 1'b1 &CLK& !RESET) begin 
                next_state = STATE4; 
                $display("Transitioning to STATE4"); 
            end else if (START & L == 1'b1 &CLK& !RESET) begin 
                next_state = STATE5; 
                $display("Transitioning to STATE5"); 
            end else if (START & E == 1'b1 &CLK& !RESET) begin 
                next_state = DONE_STATE; 
                $display("Transitioning to STATE6"); 
            end 
        end 
        STATE4: begin 
           $display("State4"); 
          if (START & CLK & !RESET) begin 
                next_state = STATE3; 
                  $display("Transitioning to STATE3"); 
              end 
             else if (!CLK & !RESET) begin 
                 $display("Transitioning to STATE4"); 
             next_state = STATE4 ; end 
          else  begin 
              $display("Transitioning to IDLE"); 
            next_state = IDLE;  
           end 
            $display("Transitioning to STATE3 from STATE4"); 
        end 
        STATE5: begin 
            $display("STATE5"); 
            if (START & CLK & !RESET) begin 
                next_state = STATE3; 
                  $display("Transitioning to STATE3"); 
                end 
          else if (!CLK & !RESET) begin 
             next_state = STATE5 ; 
               $display("Transitioning to STATE5"); end 
          else  begin 
              $display("Transitioning to STATE0"); 
            next_state = IDLE; end 
        end 
        DONE_STATE: begin 
           $display("DONE"); 
              if (!START & RESET) begin 
                 $display("Transitioning to IDLE"); 
                next_state = IDLE; 
                end 
          if (!CLK & !RESET) begin 
               $display("Transitioning to IDLE"); 
             next_state = DONE_STATE ;end 
     
         
        end 
      endcase 
    end 
         
 
always @(current_state) begin 
    case(current_state) 
        IDLE: begin 
            opcode = 3'b000; 
            operand1 = 2'b00; 
            operand2 = 2'b00; 
            DONE = 1'b0; 
        end 
        STATE1: begin 
            opcode = 3'b100; 
            operand1 = 2'b01; 
            operand2 = 2'b00; 
            DONE = 1'b0; 
        end 
        STATE2: begin 
            opcode = 3'b100; 
            operand1 = 2'b10; 
            operand2 = 2'b11; 
            DONE = 1'b0; 
        end 
        STATE3: begin 
            opcode = 3'b110; 
            operand1 = 2'b11; 
            operand2 = 2'b11; 
            DONE = 1'b0; 
        end 
        STATE4: begin 
            opcode = 3'b011; 
            operand1 = 2'b10; 
            operand2 = 2'b11; 
            DONE = 1'b0; 
        end 
        STATE5: begin 
            opcode = 3'b010; 
            operand1 = 2'b10; 
            operand2 = 2'b11; 
            DONE = 1'b0; 
        end 
        DONE_STATE: begin 
            opcode = 3'b101; 
            operand1 = 2'b10; 
            operand2 = 2'b11; 
            DONE = 1'b1; 
        end 
    endcase 
end 
 
endmodule
