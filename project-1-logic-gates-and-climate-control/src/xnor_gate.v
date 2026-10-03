module systemX1 (
    output wire F,
    input wire A, B
);
    wire An, Bn;      // internal nets

    not U0 (An, A);
    not U1 (Bn, B);

    xnor U2 (F, A, B);
endmodule
