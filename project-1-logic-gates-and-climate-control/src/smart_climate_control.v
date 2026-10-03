module systemX3 (
    output wire TS, OM, HS,
    input wire S, O, T, H
);

    wire Sn, On, Tn, Hn;
    wire m0, m2, m6;

    not U0 (Sn, S);
    not U1 (Tn, T);

    and U3 (m0, Sn, O);
    and U4 (m2, O, Tn);
    or  U5 (OM, m0, m2);
    and U6 (TS, S);
    and U7 (HS, OM, H);

endmodule
