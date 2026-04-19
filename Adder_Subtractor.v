module Adder_Subtractor (result, cout, a, b, mode);
    output [3:0] result;
    output cout;
    input [3:0] a, b;
    input mode;
    wire [3:0] b_xor;
    wire c1, c2, c3;
    xor x0 (b_xor[0], b[0], mode);
    xor x1 (b_xor[1], b[1], mode);
    xor x2 (b_xor[2], b[2], mode);
    xor x3 (b_xor[3], b[3], mode);
    FullAdder fa0 (result[0], c1, a[0], b_xor[0], mode);
    FullAdder fa1 (result[1], c2, a[1], b_xor[1], c1);
    FullAdder fa2 (result[2], c3, a[2], b_xor[2], c2);
    FullAdder fa3 (result[3], cout, a[3], b_xor[3], c3);
endmodule

