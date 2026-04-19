module BCDtoXS3 (xs3, bcd);
	output [3:0] xs3;
	input [3:0] bcd;
	wire CorD, BandCorD;
	or o1 (CorD, bcd[1], bcd[0]);
	and a1 (BandCorD, CorD, bcd[2]);
	or o2 (xs3[3], bcd[3], BandCorD);
	xor x1 (xs3[2], bcd[2], CorD);
	xnor xn1 (xs3[1], bcd[1], bcd[0]);
	not n1 (xs3[0], bcd[0]);
endmodule

module tb_BCDtoXS3();
    reg [3:0] bcd;
    wire [3:0] xs3;
    BCDtoXS3 uut (.xs3(xs3), .bcd(bcd));
    integer i;
    initial begin
	bcd = 4'b0000; 
        for (i = 0; i < 10; i = i + 1) begin
            bcd = i;
            #10;
        end
        #10 $stop;
    end
endmodule

