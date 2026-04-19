module half_adder (
    a, b, sum, carry
);
    
    input a, b;
    output sum, carry;

    xor(sum, a, b);
    and(carry, a, b);

endmodule




module FullAdder(S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;
	wire C1, C2, S1;
	HalfAdder h1(S1, C1, A, B);
	HalfAdder h2(S, C2, S1, Cin);
	or(Cout, C1, C2);
endmodule




module FullAdder_tb;
    reg a, b, cin;
    wire s, cout;

    // Instantiate the Unit Under Test (UUT)
    FullAdder f1(s, cout, a, b, cin);

    initial 
	begin
		a = 1'b0; b = 1'b0; cin = 1'b0;
		#100
		a = 1'b0; b = 1'b0; cin = 1'b1;
		#100
		a = 1'b0; b = 1'b1; cin = 1'b0;
		#100
		a = 1'b0; b = 1'b1; cin = 1'b1;
		#100
		a = 1'b1; b = 1'b0; cin = 1'b0;
		#100
		a = 1'b1; b = 1'b0; cin = 1'b1;
		#100
		a = 1'b1; b = 1'b1; cin = 1'b0;
		#100
		a = 1'b1; b = 1'b1; cin = 1'b1;
		

    	end

endmodule




