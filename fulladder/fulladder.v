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