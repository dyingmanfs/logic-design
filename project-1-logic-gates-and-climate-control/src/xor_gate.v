module systemX6 (output wire F, input wire A, B);
    wire An, Bn;      // internal nets
    wire m1, m3, m4, m6;

    not U0 (An, A);
    not U1 (Bn, B);

    xor U7 (F, A, B);
endmodule
