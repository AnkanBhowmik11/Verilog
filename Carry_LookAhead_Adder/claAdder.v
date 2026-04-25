//4 bit CLA Adder
module halfadder (s,c,x,y);
input x, y;
output s, c;

assign s=x^y;
assign c=x&y;

endmodule

module carrygenerator (c0,c1,c2,c3,c4,g0,g1,g2,g3,p0,p1,p2,p3);

input c0,g0,g1,g2,g3,p0,p1,p2,p3;   
output c1,c2,c3,c4;

assign c1= (p0 & c0) | g0;
assign c2= g1 | (p1 & g0) | (p1 & p0 & c0);
assign c3= g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & c0);
assign c4= g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c0);

endmodule

module claAdder(a,b,cin,sum,cout);

input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4;

halfadder ha0(p0,g0,a[0],b[0]);
halfadder ha1(p1,g1,a[1],b[1]);
halfadder ha2(p2,g2,a[2],b[2]);
halfadder ha3(p3,g3,a[3],b[3]);

carrygenerator cg(cin,c1,c2,c3,c4,g0,g1,g2,g3,p0,p1,p2,p3);

assign sum[0]= p0 ^ cin;
assign sum[1]= p1 ^ c1;
assign sum[2]= p2 ^ c2;
assign sum[3]= p3 ^ c3;
assign cout= c4;

endmodule
