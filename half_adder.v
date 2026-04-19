module half_adder (
    a, b, sum, carry
);
    
    input a, b;
    output sum, carry;

    xor(sum, a, b);
    and(carry, a, b);

endmodule


module half_adder_tb();

    reg a, b;
    wire sum, carry;

    half_adder ha (a, b, sum, carry);

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);
        a = 0 ; b = 0; #5;
        a = 0 ; b = 1; #5;
        a = 1 ; b = 0; #5;
        a = 1 ; b = 1; #5;
    end

endmodule