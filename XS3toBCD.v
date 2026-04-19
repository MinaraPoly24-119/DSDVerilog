
module XS3toBCD (bcd, xs3);
    output [3:0] bcd;
    input [3:0] xs3;
    wire n_xs2, n_xs1, n_xs0;
    wire a_and1, a_and2;
    wire b_and1, b_and2, b_and3;
    not u1 (n_xs2, xs3[2]);
    not u2 (n_xs1, xs3[1]);
    not u3 (n_xs0, xs3[0]);
    and u4 (a_and1, xs3[3], xs3[2]);
    and u5 (a_and2, xs3[3], xs3[1], xs3[0]);
    or  u6 (bcd[3], a_and1, a_and2);
    and u7 (b_and1, n_xs2, n_xs1);
    and u8 (b_and2, n_xs2, n_xs0);
    and u9 (b_and3, xs3[2], xs3[1], xs3[0]);
    or  u10 (bcd[2], b_and1, b_and2, b_and3);
    xor u11 (bcd[1], xs3[1], xs3[0]);
    not u12 (bcd[0], xs3[0]);
endmodule

module tb_XS3_to_BCD;
    reg [3:0] xs3;
    wire [3:0] bcd;
    XS3toBCD uut (.bcd(bcd), .xs3(xs3));
    integer i = 0;
    initial begin
	xs3 = 4'b0011; 
        for (i = 0; i < 10; i = i + 1) begin
            xs3 = 3+i;
            #13;
        end
        #13;
    end
endmodule
