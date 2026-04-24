module halfadder (s,c,x,y);
 
input x, y;
output s,c;

assign s=x^y;
assign c=x&y;

endmodule
//full adder using half adder

module fulladder (s,c,x,y,z);
input x,y,z;
output s,c;
wire s1, d1, d2;
halfadder ha1(s1, d1, x,y);
halfadder ha2(s, d2, s1, z);

assign c=d1 | d2;

endmodule

//4 bit fulladder
module fourbitfulladder (s,c4,a,b,c0);

input c0;
input [3:0] a,b;
output [3:0] s;
output c4;

wire c1,c2,c3;

fulladder fa0(s[0],c1,a[0],b[0],c0);
fulladder fa1(s[1],c2,a[1],b[1],c1);
fulladder fa2(s[2],c3,a[2],b[2],c2);
fulladder fa3(s[3],c4,a[3],b[3],c3);

endmodule
