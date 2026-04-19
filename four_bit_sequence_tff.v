/* Sequence: 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000 */
/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr variable to 0 only for the first run. 
After the first run, Force the value to 1. 
*/
`include "master_slave_jkff.v"  // no need to include in modelsim

module four_bit_sequence (q, clk, clr);

    input clk, clr;
    output [3:0] q;
    wire [3:0] qbar;
    wire w1, w2, w3, w4, w5;  

    // this circuit was designed using T-flipflop
    // but implemented with jk where both j and k input are same
    xor (w1, q[1], q[0]);
    master_slave_jkff msjkff0 (w1, w1, clk, clr, q[0], qbar[0]);
    xor (w2, q[2], q[1]);
    master_slave_jkff msjkff1 (w2, w2, clk, clr, q[1], qbar[1]);
    xor (w3, q[3], q[2]);
    master_slave_jkff msjkff2 (w3, w3, clk, clr, q[2], qbar[2]);
    xnor (w4, q[3], q[0]);
    master_slave_jkff msjkff3 (w4, w4, clk, clr, q[3], qbar[3]);

endmodule