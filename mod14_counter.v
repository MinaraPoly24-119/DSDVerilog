/*
    for mod(>10) an extra input is needed
    simulation:
        set clk to clock
        intially set clr = 0, extra = 1
        after first run set clr = No force, extra = 0
*/

module jkff(q,qb,j,k,clr,clk);

    input clr,clk,j,k;
    output q,qb;

    wire a,b,c,d,e,f,cb;

    nand(a,qb,j,clk,clr);
    nand(b,q,k,clk);
    nand(c,a,d);
    nand(d,c,b,clr);

    not(cb,clk);

    nand(e,cb,c);
    nand(f,d,cb);
    nand(q,qb,e);
    nand(qb,q,f,clr);

endmodule


module mod14(q,qb,clr,clk, extra);

    input clr,clk, extra;
    output [3:0]q,qb;

    wire a;

    nand(a,q[1],q[2],q[3]);
    or (clr, a, extra);

    jkff jk0(q[0],qb[0],1,1,clr,clk);
    jkff jk1(q[1],qb[1],1,1,clr,q[0]);
    jkff jk2(q[2],qb[2],1,1,clr,q[1]);
    jkff jk3(q[3],qb[3],1,1,clr,q[2]);

endmodule