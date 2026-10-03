module systemx (output wire F, input wire A);
    wire An;      // internal nets
    wire m1;

    not U0 (m1, An, A);
    assign F = m1;
endmodule
