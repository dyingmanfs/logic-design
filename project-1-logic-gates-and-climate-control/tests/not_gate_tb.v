module My_testbench();
    reg A;
    wire F;

    systemx DUT (F, A);

    initial begin
        A = 1'b0; #100;
        A = 1'b1; #100;
    end
endmodule
