module gray_to_binary (
  out,
  in
);

  output [3:0] out;
  input [3:0] in;

  buf (out[3], in[3]);
  xor (out[2], out[3], in[2]);
  xor (out[1], out[2], in[1]);
  xor (out[0], out[1], in[0]);

endmodule


module gray_to_binary_tb ();

  reg  [3:0] gray;
  wire [3:0] binary;

  gray_to_binary g2b (
    .out(binary),
    .in (gray)
  );

  initial begin
    $dumpfile("gray_to_binary.vcd");
    $dumpvars(0, gray_to_binary_tb);

    gray = 4'b0000;
    #50;
    gray = 4'b0001;
    #50;
    gray = 4'b0010;
    #50;
    gray = 4'b0011;
    #50;
    gray = 4'b0100;
    #50;
    gray = 4'b0101;
    #50;
    gray = 4'b0110;
    #50;
    gray = 4'b0111;
    #50;
    gray = 4'b1000;
    #50;
    gray = 4'b1001;
    #50;
    gray = 4'b1010;
    #50;
    gray = 4'b1011;
    #50;
    gray = 4'b1100;
    #50;
    gray = 4'b1101;
    #50;
    gray = 4'b1110;
    #50;
    gray = 4'b1111;
    #50;
  end

endmodule
