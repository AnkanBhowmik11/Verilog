module fourbitcomparator(
    input [3:0] a,
    input [3:0] b,
    output e,g,l
);
wire x0,x1,x2,x3;

assign x0= (a[0] & b[0]) | ((~a[0] & ~b[0]));
assign x1= (a[1] & b[1]) | ((~a[1] & ~b[1]));
assign x2= (a[2] & b[2]) | ((~a[2] & ~b[2]));
assign x3= (a[3] & b[3]) | ((~a[3] & ~b[3]));

assign e= (x0 & x1 & x2 & x3);
assign g= (a[3] & ~b[3]) | (x3 & a[2] & ~b[2]) | (x3 & x2 & a[1] & ~b[1]) | (x3 & x2 & x1 & a[0] & ~b[0]);
assign l= (~a[3] & b[3]) | (x3 & ~a[2] & b[2]) | (x3 & x2 & ~a[1] & b[1]) | (x3 & x2 & x1 & ~a[0] & b[0]);

endmodule