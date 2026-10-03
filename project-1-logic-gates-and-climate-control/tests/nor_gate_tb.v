module My_testbench();
    reg A, B;

    systemX7 DUT (F, A, B);

    initial begin
        A = 1'b0; B = 1'b0; #100;
        A = 1'b0; B = 1'b1; #100;
        A = 1'b1; B = 1'b0; #100;
        A = 1'b1; B = 1'b1; #100;
    end
endmodule
