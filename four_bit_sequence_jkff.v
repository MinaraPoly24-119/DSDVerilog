/* Sequence: 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000 */
/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr variable to 0 only for the first run. 
After the first run, Force the value to 1. 
*/
`include "master_slave_jkff.v"  // no need to include in modelsim

module four_bit_sequence_jkff (q, clk, clr);

    input clk, clr;
    output [3:0] q;
    wire [3:0] qbar;

    master_slave_jkff msjkff0 (q[1], qbar[1], clk, clr, q[0], qbar[0]);
    master_slave_jkff msjkff1 (q[2], qbar[2], clk, clr, q[1], qbar[1]);
    master_slave_jkff msjkff2 (q[3], qbar[3], clk, clr, q[2], qbar[2]);
    master_slave_jkff msjkff3 (qbar[0], q[0], clk, clr, q[3], qbar[3]);

endmodule