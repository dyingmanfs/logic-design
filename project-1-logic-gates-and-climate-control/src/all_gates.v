module systemX8 (
    output wire and1, or1, nand1, nor1, xor1, nota, notb, xnor1,
    input wire A, B
);

    wire An, Bn;      // internal nets

    not U0 (nota, A);
    not U1 (notb, B);

    and U2 (and1, A, B);
    or U3 (or1, A, B);
    nand U4 (nand1, A, B);
    nor U5 (nor1, A, B);
    xor U6 (xor1, A, B);
    xnor U7 (xnor1, A, B);

endmodule
