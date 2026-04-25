/*
Given:
F = Σm(1,3,4,11,12,13,14)

Truth Table (TT)

a b c d | F
----------------
0 0 0 0 | 0
0 0 0 1 | 1
0 0 1 0 | 0
0 0 1 1 | 1
0 1 0 0 | 1
0 1 0 1 | 0
0 1 1 0 | 0
0 1 1 1 | 0
1 0 0 0 | 0
1 0 0 1 | 0
1 0 1 0 | 0
1 0 1 1 | 1
1 1 0 0 | 1
1 1 0 1 | 1
1 1 1 0 | 1
1 1 1 1 | 0


Grouped in 2 Rows
(Using 8:1 MUX with Select Lines = A, B, C)

A B C | F Expression
---------------------
0 0 0 | D
0 0 1 | D
0 1 0 | D'
0 1 1 | 0
1 0 0 | 0
1 0 1 | D
1 1 0 | 1
1 1 1 | D'


Final MUX Inputs

I0 = D
I1 = D
I2 = D'
I3 = 0
I4 = 0
I5 = D
I6 = 1
I7 = D'

*/

module mux_8to1(i0,i1,i2,i3,i4,i5,i6,i7,s2,s1,s0,y);

input i0,i1,i2,i3,i4,i5,i6,i7,s2,s1,s0;
output y;

wire y0,y1,y2,y3,y4,y5,y6,y7;

assign y0= (i0 & ~s2 & ~s1 & ~s0);
assign y1= (i1 & ~s2 & ~s1 & s0);
assign y2= (i2 & ~s2 & s1 & ~s0);
assign y3= (i3 & ~s2 & s1 & s0);
assign y4= (i4 & s2 & ~s1 & ~s0);
assign y5= (i5 & s2 & ~s1 & s0);
assign y6= (i6 & s2 & s1 & ~s0);
assign y7= (i7 & s2 & s1 & s0);

assign y= (y0 | y1 | y2 | y3 | y4 | y5 | y6 | y7);

endmodule

module func(a,b,c,d,out);
input a,b,c,d;
output out;

mux_8to1 mux1(.i0(d),.i1(d),.i2(~d),.i3(1'b0),.i4(1'b0),.i5(d),.i6(1'b1),.i7(1'b1),.s2(a),.s1(b),.s0(c),.y(out));

endmodule