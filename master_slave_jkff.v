/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr to 0 only for the first run. 
After the first run, force the value to 1. 
*/
module master_slave_jkff (
  j, k, clk, clr, q, qbar
);

  input j, k, clk, clr;
  output q, qbar;

  wire w1, w2, w3, w4, w5, w6, clkbar;

  nand (w1, j, clk, qbar, clr);
  nand (w2, k, clk, q);
  nand (w3, w1, w4);
  nand (w4, w2, w3, clr);

  not (clkbar, clk);

  nand (w5, w3, clkbar);
  nand (w6, w4, clkbar);
  nand (q, w5, qbar);
  nand (qbar, w6, q);

endmodule