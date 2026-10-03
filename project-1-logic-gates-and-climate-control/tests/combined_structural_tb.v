module My_testbencha();
    reg A, B;

    systemX DUT (F, S, D, E, G, M, A, B);

    initial begin
        A = 1'b0; B = 1'b0; #100;
        A = 1'b0; B = 1'b1; #100;
        A = 1'b1; B = 1'b0; #100;
        A = 1'b1; B = 1'b1; #100;
    end
endmodule
