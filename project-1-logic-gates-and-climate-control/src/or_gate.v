module systemX3 (output wire F, input wire A, B);
    wire An, Bn;      // internal nets

    or U7 (F, A, B);
endmodule
