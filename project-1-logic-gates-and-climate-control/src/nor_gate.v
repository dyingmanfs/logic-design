module systemX7 (output wire F, input wire A, B);
    wire An, Bn;      // internal nets

    nor U7 (F, A, B);
endmodule
