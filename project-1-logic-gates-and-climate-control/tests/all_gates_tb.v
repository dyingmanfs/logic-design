module My_testbench();
    reg A, B;

    systemX8 DUT (and1, or1, nand1, nor1, xor1, nota, notb, xnor1, A, B);

    initial begin
        A = 1'b0; B = 1'b0; #100;
        A = 1'b0; B = 1'b1; #100;
        A = 1'b1; B = 1'b0; #100;
        A = 1'b1; B = 1'b1; #100;
    end
endmodule
