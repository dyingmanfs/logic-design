module systemX (
    output wire F, S, D, E, G, M,
    input wire A, B
);

    wire An, Bn;

    not U0 (An, A);
    not U1 (Bn, B);

    and U3 (F, A, B);
    and U4 (S, An, Bn);
    or  U5 (D, A, B);

    or  U6 (E, An, Bn);
    xor U7 (G, A, B);
    xor U8 (M, An, Bn);

endmodule
