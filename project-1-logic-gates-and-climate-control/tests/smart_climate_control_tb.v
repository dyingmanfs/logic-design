module My_testbench();
    reg S, O, T, H;
    systemX3 DUT (TS, OM, HS, S, O, T, H);

    initial begin
        S = 1'b0; O = 1'b0; T = 1'b0; H = 1'b0; #100;
        S = 1'b0; O = 1'b0; T = 1'b0; H = 1'b1; #100;
        S = 1'b0; O = 1'b0; T = 1'b1; H = 1'b0; #100;
        S = 1'b0; O = 1'b0; T = 1'b1; H = 1'b1; #100;

        S = 1'b0; O = 1'b1; T = 1'b0; H = 1'b0; #100;
        S = 1'b0; O = 1'b1; T = 1'b0; H = 1'b1; #100;
        S = 1'b0; O = 1'b1; T = 1'b1; H = 1'b0; #100;
        S = 1'b0; O = 1'b1; T = 1'b1; H = 1'b1; #100;

        S = 1'b1; O = 1'b0; T = 1'b0; H = 1'b1; #100;
        S = 1'b1; O = 1'b0; T = 1'b0; H = 1'b1; #100;
        S = 1'b1; O = 1'b0; T = 1'b1; H = 1'b1; #100;
        S = 1'b1; O = 1'b0; T = 1'b1; H = 1'b1; #100;

        S = 1'b1; O = 1'b1; T = 1'b0; H = 1'b1; #100;
        S = 1'b1; O = 1'b1; T = 1'b0; H = 1'b1; #100;
        S = 1'b1; O = 1'b1; T = 1'b1; H = 1'b1; #100;
        S = 1'b1; O = 1'b1; T = 1'b1; H = 1'b1; #100;
    end
endmodule
