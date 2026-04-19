/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr to 0 only for the first run. 
After the first run, force the value to 1. 
*/
`include "master_slave_jkff.v"  // no need to include in modelsim

module three_bit_sync_updown (q, clk, m, clr);

    input clk, m, clr;
    output [2:0] q;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, mbar;

    reg j = 1, k = 1;

    master_slave_jkff msjkff0 (j, k, clk, clr, q[0], w1);
    not (mbar, m);
    and (w2, q[0], mbar);
    and (w3, w1, m);
    or (w4, w2, w3);
    master_slave_jkff msjkff1 (w4, w4, clk, clr, q[1], w5);
    and (w6, q[1], w2);
    and (w7, w3, w5);
    or (w8, w6, w7);
    master_slave_jkff msjkff2 (w8, w8, clk, clr, q[2], w9);

endmodule 